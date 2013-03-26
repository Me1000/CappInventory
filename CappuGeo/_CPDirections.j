/*
 * CPDirections.j
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

@import "CPLocation.j"


CPDirectionsDrivingMode = google.maps.DirectionsTravelMode.DRIVING;
CPDirectionsWalkingMode = google.maps.DirectionsTravelMode.WALKING;

@implementation CPDirections : CPLocation
{
    JSObject            _service;
    JSObject            _renderer;
    
    CPLocation          origin      @accessors;
    CPLocation          destination @accessors;
    CPString            travelMode  @accessors;
    
    CPMapView           mapView     @accessors;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _service = new google.maps.DirectionsService();
        _renderer = new google.maps.DirectionsRenderer();
        
        travelMode = CPDirectionsDrivingMode;
    }
    
    return self;
}

- (void)setMapView:(CPMapView)aMapView
{
    mapView = aMapView;
    
    if (mapView && mapView._map)
        _renderer.setMap(mapView._map);
    else
        _renderer.setMap(nil);
}

- (@action)routeWithMap:(CPMapView)aMap detailsView:(CPWebView)theDetailsView
{
    if (!origin || !destination || !travelMode)
        return;
    
    var request = {
        'origin': [origin lat] ? [origin _gLatLng] : [origin description],
        'destination': [destination lat] ? [destination _gLatLng] : [destination description],
        'travelMode': travelMode
    };
    
    _service.route(request, function (result, status) {
        if (status == google.maps.DirectionsStatus.OK)
        {
            _renderer.setMap(aMap._map);
            [theDetailsView clear];
            _renderer.setPanel([theDetailsView theDiv]);
            _renderer.setDirections(result);
            //FIX ME: surely this can be done better
            //resize the div frame, but give the browser a second to render it first
            window.setTimeout(function(){
                [theDetailsView _resizeFrame];
            },1000);
        }
        else
        {
            _renderer.setDirections(nil);
        }
    });
}

- (@action)route:(id)aSender
{
    if (!origin || !destination || !travelMode)
        return;
    
    var request = {
        'origin': [origin lat] ? [origin _gLatLng] : [origin description],
        'destination': [destination lat] ? [destination _gLatLng] : [destination description],
        'travelMode': travelMode
    };
//    console.log([origin description]);
  //  console.log([destination description]);
    _service.route(request, function (result, status) {
        if (status == google.maps.DirectionsStatus.OK)
        {
            //console.log(_renderer.getMap());
            _renderer.setDirections(result);
        }
        else
        {
            //console.log(status);
            _renderer.setDirections(nil);
        }
    });
}

@end
