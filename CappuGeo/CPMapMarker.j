/*
 * CPMapMarker.j
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

@import <Foundation/CPObject.j>


@implementation CPMapMarker : CPObject
{
    JSObject        _marker;
    
    CPLocation      location        @accessors;
    CPMapView       mapView         @accessors;
    
    CPString        title           @accessors;
    CPImage         image           @accessors;
    
    BOOL            draggable       @accessors;
    
    id              target          @accessors;
    SEL             action          @accessors;
    SEL             mouseOverAction @accessors;
    SEL             mouseOutAction  @accessors;
    SEL             dragAction      @accessors;
    
    id              tag             @accessors;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _marker = new google.maps.Marker({});
        
        google.maps.event.addListener(_marker, 'click', function(){
            if (action)
                objj_msgSend(target, action, self);
        });
        
        google.maps.event.addListener(_marker, 'mouseover', function(){
            if (mouseOverAction)
                objj_msgSend(target, mouseOverAction, self);
        });
        
        google.maps.event.addListener(_marker, 'mouseout', function(){
            if (mouseOutAction)
                objj_msgSend(target, mouseOutAction, self);
        });
        
        google.maps.event.addListener(_marker, 'dragend', function(){
            if (draggable && dragAction)
                objj_msgSend(target, dragAction, self);
        });
    }
    
    return self;
}

- (void)setLocation:(CPLocation)aLocation
{
    location = aLocation;
    
    var ll = [aLocation _gLatLng];
    if (ll)
        _marker.setPosition(ll);
    
    var desc = [aLocation description];
    if (desc)
        [self setTitle:desc];
}

- (void)setMapView:(CPMapView)aMapView
{
    mapView = aMapView;
    
    if (mapView && mapView._map)
        _marker.setMap(mapView._map);
    else
        _marker.setMap(nil);
}

- (void)setTitle:(CPString)aTitle
{
    title = aTitle;
    
    _marker.setTitle(title);
}

- (void)setImage:(CPImage)anImage
{
    image = anImage;
    
    _marker.setIcon([image filename]);
}

- (void)setDraggable:(BOOL)aFlag
{
    draggable = aFlag;
    
    _marker.setDraggable(draggable);
}

- (JSObject)_gLatLng
{
    return [self _position];
}

- (JSObject)_position
{
    return _marker.getPosition();
}

- (CGPoint)frameOrigin
{
    return [mapView pointFromLocation:location];
}

@end
