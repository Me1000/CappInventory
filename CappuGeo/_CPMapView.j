/*
 * CPMapView.j
 * CappuGeo for Google Maps
 *
 * Created by Nicholas Small.
 * Copyright 2009, 280 North, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

@import <AppKit/CPView.j>

@import "CPMapImage.j"
@import "CPMapMarker.j"


CPMapTypeRoadmap = google.maps.MapTypeId.ROADMAP;
CPMapTypeSatellite = google.maps.MapTypeId.SATELLITE;
CPMapTypeTerrain = google.maps.MapTypeId.TERRAIN;
CPMapTypeHybrid = google.maps.MapTypeId.HYBRID;

CPMapViewWillLoad = @"CPMapViewWillLoad";
CPMapViewDidLoad = @"CPMapViewDidLoad";

var edgesMap = [];
edgesMap[CPMinXEdge] = google.maps.ControlPosition.LEFT;
edgesMap[CPMaxXEdge] = google.maps.ControlPosition.RIGHT;
edgesMap[CPMinYEdge] = google.maps.ControlPosition.TOP;
edgesMap[CPMaxYEdge] = google.maps.ControlPosition.BOTTOM;
edgesMap[CPMinXEdge & CPMinYEdge] = google.maps.ControlPosition.TOP_LEFT;
edgesMap[CPMinXEdge & CPMaxYEdge] = google.maps.ControlPosition.BOTTOM_LEFT;
edgesMap[CPMaxXEdge & CPMinYEdge] = google.maps.ControlPosition.TOP_RIGHT;
edgesMap[CPMaxXEdge & CPMaxYEdge] = google.maps.ControlPosition.BOTTOM_RIGHT;


@implementation CPMapView : CPView
{
    JSObject                _map;
    BOOL                    mapLoaded       @accessors(readonly);
    CPRectEdge              mapTypeEdge     @accessors;
    
    id                      delegate        @accessors;
    
    CPLocation              location        @accessors;
    CPMapMarker             locationMarker  @accessors(readonly);
    
    NilOverlay              _overlay;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    
    if (self)
    {
        mapTypeEdge = CPMaxXEdge | CPMinYEdge;
    }
    
    return self;
}

- (void)resizeWithOldSuperviewSize:(CGSize)aSize
{
    [super resizeWithOldSuperviewSize:aSize];
    
    if (_map)
        google.maps.event.trigger(_map, 'resize');
}

- (void)viewDidMoveToWindow
{
    window.setTimeout(function(){
        var center = [CPNotificationCenter defaultCenter];
        
        [center postNotificationName:CPMapViewWillLoad object:self];
        _map = new google.maps.Map(_DOMElement, {mapTypeId: CPMapTypeRoadmap});
        mapLoaded = YES;
        
        _overlay = new NilOverlay({'map': _map});
        
        google.maps.event.addListener(_map, 'zoom_changed', function() {
            if ([delegate respondsToSelector:@selector(mapViewDidZoom:)])
                [delegate mapViewDidZoom:self];
        });
        
        google.maps.event.addListener(_map, 'maptypeid_changed', function() {
            if ([delegate respondsToSelector:@selector(mapViewDidChangeType:)])
                [delegate mapViewDidChangeType:self];
        });
        
        [center postNotificationName:CPMapViewDidLoad object:self];
    }, 0);
}

- (void)release
{
    if (_map)
        _map = nil;
    
    [super release];
}

- (void)setDelegate:(id)aDelegate
{
    var center = [CPNotificationCenter defaultCenter];
    
    if (delegate)
    {
        [center removeObserver:delegate name:CPMapViewWillLoad object:self];
        [center removeObserver:delegate name:CPMapViewDidLoad object:self];
    }
    
    delegate = aDelegate;
    
    if (delegate)
    {
        if ([delegate respondsToSelector:@selector(mapViewWillLoad:)])
            [center addObserver:delegate selector:@selector(mapViewWillLoad:) name:CPMapViewWillLoad object:self];
        
        if ([delegate respondsToSelector:@selector(mapViewDidLoad:)])
            [center addObserver:delegate selector:@selector(mapViewDidLoad:) name:CPMapViewDidLoad object:self];
    }
}

- (void)setLocation:(CPLocation)aLocation
{
    if (location)
    {
        [locationMarker setMapView:nil];
        locationMarker = nil;
    }
    
    location = aLocation;
    
    if (location)
    {
        locationMarker = [aLocation marker];
        
        window.setTimeout(function(){
            if (!_map)
                return;
            
            var zoom = _map.getZoom();
            
            _map.setCenter([locationMarker _position]);
            
            if (!zoom)
                _map.setZoom(13);
            
            [locationMarker setMapView:self];
        }, 0);
    }
}

- (void)setMapTypeEdge:(CPRectEdge)anEdge
{
    if (mapTypeEdge === anEdge)
        return;
    
    mapTypeEdge = anEdge;
    
    window.setTimeout(function() {
        if (!_map)
            return;
        
        _map.setOptions({
            mapTypeControlOptions: {position: edgesMap[mapTypeEdge]}
        });
    }, 0);
}

- (int)zoom
{
    if (!_map)
        return;
    
    return _map.getZoom();
}

- (void)setZoom:(int)aZoom
{
    if (!_map)
        return;
    
    _map.setZoom(aZoom);
}

- (unsigned)mapType
{
    if (!_map)
        return;
    
    return _map.getMapTypeId();
}

- (void)setMapType:(unsigned)aType
{
    if (!_map)
        return;
    
    _map.setMapTypeId(aType);
}

- (void)mouseDragged:(CPEvent)anEvent
{
    [[[self window] platformWindow] _propagateCurrentDOMEvent:YES];
}

- (CGPoint)pointFromLocation:(CPLocation)aLocation
{
    var proj = _overlay.getProjection(),
        point = proj.fromLatLngToDivPixel([aLocation _gLatLng]);
    
    if (point)
        return CGPointMake(point.x, point.y);
}

- (CPLocation)locationFromPoint:(CGPoint)aPoint
{
    var proj = _overlay.getProjection(),
        point = new google.maps.Point(aPoint.x, aPoint.y),
        ll = proj.fromDivPixelToLatLng(point);
    
    if (ll)
    {
        var loc = [[CPLocation alloc] init];
        [loc _setGLatLng:ll];
        
        return loc;
    }
}

- (JSObject)_gBounds
{
    if (_map)
        return _map.getBounds();
}

- (void)fitLocations:(CPArray)anArray
{
    var bounds = new google.maps.LatLngBounds();
    
    for (var i = 0, count = [anArray count]; i < count; i++)
        bounds.extend([anArray[i] _gLatLng]);
    
    if (_map)
        _map.fitBounds(bounds);
}

@end


function NilOverlay(options)
{
    this.setValues(options);
    
    var div = this.div_ = document.createElement('div');
    div.className = "overlay";
}

NilOverlay.prototype = new google.maps.OverlayView;
NilOverlay.prototype.onAdd = function() {
    var pane = this.getPanes().overlayLayer;
    pane.appendChild(this.div_);
}

NilOverlay.prototype.onRemove = function() {
    this.div_.parentNode.removeChild(this.div_);
}

NilOverlay.prototype.draw = function() {
    var proj = this.getProjection(),
        pos = proj.fromLatLngToDivPixel(this.getMap().getCenter());
    
    var div = this.div_;
    div.style.left = pos.x + 'px';
    div.style.top = pos.y + 'px';
    div.style.display = 'block';
}
