/*
 * CPLocationController.j
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
@import "CPMapView.j"


var SharedController;

CurrentLocationDidChange = @"CurrentLocationDidChange";

MapsAPIIsLoaded = NO;
geoip_region = nil;

function CPLocationControllerLoadMapsAPI(callback)
{
    if (MapsAPIIsLoaded)
        return;
    
    google.load("maps", "3", {'other_params': {'sensor': true}});
    
    google.setOnLoadCallback(function(){
        MapsAPIIsLoaded = YES;
        
        if (callback)
            callback();
    });
}

@implementation CPLocationController : CPObject
{
    CPLocation          currentLocation         @accessors;
    
    float               trackingInterval        @accessors;
    JSObject            _trackingInterval;
    
    BOOL                _nativeLocationHasFailed;
    Function            _sensorLocationCallback;
}

+ (id)sharedController
{
    if (!SharedController)
        SharedController = [[[self class] alloc] init];
    
    return SharedController;
}

+ (void)loadMapsAPI
{
    CPLocationControllerLoadMapsAPI();
}

- (void)startTrackingLocation
{
    if (_trackingInterval)
        [self stopTrackingLocation];
    
    if (!trackingInterval)
        trackingInterval = 3 * 60 * 1000;
    
    _trackingInterval = window.setInterval(function(){
        [self locate];
    }, trackingInterval);
    
    [self locate];
}

- (void)stopTrackingLocation
{
    if (!_trackingInterval)
        return;
    
    window.clearInterval(_trackingInterval);
}

- (void)locate
{
    if (!_nativeLocationHasFailed && navigator && navigator.geolocation)
    {
        navigator.geolocation.getCurrentPosition(function(loc) {
            if (!loc || !loc.coords.latitude || !loc.coords.longitude)
            {
                _nativeLocationHasFailed = YES;
                [self locate];
                
                return;
            }
            
            var location = [[CPLocation alloc] init];
            [location setLat:loc.coords.latitude];
            [location setLon:loc.coords.longitude];
            [location _setSensorLat:loc.coords.latitude];
            [location _setSensorLon:loc.coords.longitude];
            
            if (_sensorLocationCallback)
            {
                [location _reverseGeocodeWithCallback:function() {
                    currentLocation = location;
                    _sensorLocationCallback(location);
                    _sensorLocationCallback = nil;
                }];
            }
            else
            {
                [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(sensorLocationDidGeocode:) name:LocationDidGeocode object:location];
                [location reverseGeocode];
            }
        }, function(error) {
            _nativeLocationHasFailed = YES;
            [self locate];
        });
    }
    else if (NO && google && google.loader && google.loader.ClientLocation)
    {
        var loc = google.loader.ClientLocation,
            location = [[CPLocation alloc] init];
        
        [location setLat:loc.latitude];
        [location setLon:loc.longitude];
        [location _setSensorLat:loc.latitude];
        [location _setSensorLon:loc.longitude];
        
        //[location setCity:loc.address.city];
        //[location setRegion:loc.address.region];
        //[location setCountry:loc.address.country];
        
        if (_sensorLocationCallback)
        {
            currentLocation = location;
            _sensorLocationCallback(location);
            _sensorLocationCallback = nil;
        }
        else
        {
            [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(sensorLocationDidGeocode:) name:LocationDidGeocode object:location];
            [location reverseGeocode]; 
        }
    }
    else
    {
        var script = document.createElement('script');
        script.src = 'http://j.maxmind.com/app/geoip.js';
        script.type = 'text/javascript';
        
        document.body.appendChild(script);
        
        var interval = window.setNativeInterval(function() {
            if (geoip_region)
            {
                window.clearInterval(interval);
                
                var location = [[CPLocation alloc] init];
                [location setCity:geoip_city()];
                [location setRegion:geoip_region()];
                [location setPostal:geoip_postal_code()];
                
                [location _setSensorLat:geoip_latitude()];
                [location _setSensorLon:geoip_longitude()];
                
                geoip_region = nil;
                document.body.removeChild(script);
                
                if (_sensorLocationCallback)
                {
                    currentLocation = location;
                    _sensorLocationCallback(location);
                    _sensorLocationCallback = nil;
                }
                else
                {
                    [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(sensorLocationDidGeocode:) name:LocationDidGeocode object:location];
                    [location geocode]; 
                }
            }
        }, 100);
    }
}

- (void)_locateWithCallback:(Function)aCallback
{
    _sensorLocationCallback = aCallback;
    [self locate];
}

- (void)sensorLocationDidGeocode:(CPNotification)aNotification
{
    [[CPNotificationCenter defaultCenter] removeObserver:self name:LocationDidGeocode object:[aNotification object]];
    [self setCurrentLocation:[aNotification object]];
}

- (void)setCurrentLocation:(CPLocation)aLocation
{
    currentLocation = aLocation;
    [[CPNotificationCenter defaultCenter] postNotificationName:CurrentLocationDidChange object:self];
}

@end