/*
 * CPLocation.j
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


LocationDidGeocode = @"LocationDidGeocode";

Number.prototype.toRad = function() {
    return this * PI / 180;
}

Number.prototype.toDeg = function() {
    return this * 180 / PI;
}

latLonDistance = function(lat1, lon1, lat2, lon2) {
    var r = 6371,
        dLat = (lat2 - lat1).toRad(),
        dLon = (lon2 - lon1).toRad();
    
    lat1 = (new Number(lat1)).toRad();
    lat2 = (new Number(lat2)).toRad();
    
    var sin = SIN(dLat/2);
    sin = sin*sin;
    var sin2 = SIN(dLon/2);
    sin2 = sin2*sin2;
    
    var cos = COS(lat1) * COS(lat2);
    
    var a = sin + cos * sin2,
        c = 2 * ATAN2(SQRT(a), SQRT(1-a));
    
    return r * c;
}

@implementation CPLocation : CPObject // Could just as easily be CPActiveRecord
{
    CPString            name            @accessors;
    
    float               lat             @accessors;
    float               lon             @accessors;
    float               _sensorLat      @accessors;
    float               _sensorLon      @accessors;
    
    CPString            street          @accessors;
    CPString            area            @accessors;
    CPString            city            @accessors;
    CPString            region          @accessors;
    CPString            country         @accessors;
    CPString            postal          @accessors;
    
    JSObject            _geocoder;
    Function            _geocodeCallback;
}

- (id)initWithString:(CPString)aString
{
    self = [self init];
    
    if (self)
    {
        street = aString;
        [self geocode];
        street = nil;
    }
    
    return self;
}

- (CPString)description
{
    var array = [street || @"", city || @"", region || @"", country || @""];
    [array removeObject:@""];
    
    return [array componentsJoinedByString:@", "];
}

- (BOOL)isEqual:(CPLocation)aLocation
{
    return [self description] == [aLocation description];
}

- (CPSortDescriptor)compareFromCurrentLocation:(CPLocation)aLocation
{
    var lhs = self,
        rhs = aLocation,
        current = [[CPLocationController sharedController] currentLocation];
    
    var lhsDistance = [lhs distance:current],
        rhsDistance = [rhs distance:current];
    
    if (lhsDistance > rhsDistance) return CPOrderedDescending;
    else if (lhsDistance < rhsDistance) return CPOrderedAscending;
    else return CPOrderedSame;
}

- (float)distance:(CPLocation)aLocation
{
    return latLonDistance(lat, lon, [aLocation lat], [aLocation lon]);
}

- (CPString)areaDescription
{
    if (city && region)
        return city + @", " + region;
    else if (region && country)
        return region + @", " + country;
}

- (CPString)distanceDescription
{
    var convertedDistance = FLOOR([self distance:[[CPLocationController sharedController] currentLocation]] * (MeasurementUnits == @"m" ? 0.621371192 : 1));
    
    return convertedDistance == 0 ? @"Right here!" : convertedDistance + (MeasurementUnits == @"m" ? (convertedDistance == 1 ? @" mile" : @" miles") : @"km") + @" away"
}

- (CPString)coords
{
    return lat + @"," + lon;
}

- (CPString)_sensorCoords
{
    return _sensorLat + @"," + _sensorLon;
}

- (JSObject)_gLatLng
{
    if (lat && lon)
        return new google.maps.LatLng(lat, lon);
}

- (void)_setGLatLng:(JSObject)anObject
{
    [self setLat:anObject.lat()];
    [self setLon:anObject.lng()];
}

- (CPMapMarker)marker
{
    var marker = [[CPMapMarker alloc] init];
    [marker setLocation:self];
    
    return marker;
}

- (void)geocode
{
    if (!_geocoder)
        _geocoder = new google.maps.Geocoder();
    
    var address = [];
    
    if (street)
        [address addObject:street];
    if (city)
        [address addObject:city];
    if (region)
        [address addObject:region];
    if (country)
        [address addObject:country];
    if (postal)
        [address addObject:postal];
    
    if ([address count] < 1)
        return [CPException raise:@"NoAddress" reason:@"Tried to geocode without address."];
    
    _geocoder.geocode({'address': [address componentsJoinedByString:@", "]}, function(response, status){[self _processGeocoderResponse:response withStatus:status];});
}

- (void)reverseGeocode
{
    if (!_geocoder)
        _geocoder = new google.maps.Geocoder();
    
    var ll = [self _gLatLng];
    if (!ll)
        return [CPException raise:@"NoLatLon" reason:@"Tried to reverse geocode without coordinates."];
    
    _geocoder.geocode({'latLng': ll}, function(response, status){[self _processGeocoderResponse:response withStatus:status];});
}

- (void)_reverseGeocodeWithCallback:(Function)aCallback
{
    _geocodeCallback = aCallback;
    [self reverseGeocode];
}

- (void)_processGeocoderResponse:(CPArray)results withStatus:(CPString)aStatus
{
    if (aStatus == google.maps.GeocoderStatus.OK)
    {
        var count = [results count],
            userInfo = [];
        
        for (var i = 0; i < count; i++)
        {
            var location = [[CPLocation alloc] init],
                result = results[i];
            
            [location setLat:result.geometry.location.lat()];
            [location setLon:result.geometry.location.lng()];
            
            var json = {};
            for (var j = 0, jCount = result.address_components.length; j < jCount; j++)
            {
                var component = result.address_components[j],
                    type = component.types[0];
                
                // CPLog.info(type+": "+component.long_name);
                
                if (type == @"street_number")
                    json.street = component.short_name;
                else if (type == @"route")
                    json.route = component.short_name;
                else if (type == @"locality")
                    json.locale = component.long_name;
                else if (type == @"administrative_area_level_1")
                    json.region = component.short_name;
                else if (type == @"administrative_area_level_3")
                    json.city = component.long_name;
                else if (type == @"postal_code")
                    json.postal = component.long_name;
                else if (type == @"country")
                    json.country = component.long_name;
            }
            
            if (json.route)
                [location setStreet:(json.street ? (json.street + @" ") : @"") + json.route];
            if (json.region)
                [location setRegion:json.region];
            if (json.country)
                [location setCountry:json.country];
            if (json.postal)
                [location setPostal:json.postal];
            
            if (json.country == @"United States")
            {
                if (json.city)
                    [location setCity:json.city];
                else if (json.locale)
                    [location setCity:json.locale];
                
                if (json.locale)
                    [location setArea:json.locale];
            }
            else
            {
                if (json.locale)
                    [location setCity:json.locale];
                if (json.city)
                    [location setArea:json.city];
            }
            
            [userInfo addObject:location];
        }
        
        var first = userInfo[0];
        lat = [first lat] || lat;
        lon = [first lon] || lon;
        street = [first street] || street;
        area = [first area] || area;
        city = [first city] || city;
        region = [first region] || region;
        country = [first country] || country;
        postal = [first postal] || postal;
        
        if (_geocodeCallback)
        {
            _geocodeCallback();
            _geocodeCallback = nil;
        }
        else
            [[CPNotificationCenter defaultCenter] postNotificationName:LocationDidGeocode object:self userInfo:[CPDictionary dictionaryWithObject:userInfo forKey:@"ResultsList"]];
    }
    else
    {
        [[CPNotificationCenter defaultCenter] postNotificationName:LocationDidGeocode object:self];
    }
}

@end

@implementation CPLocation (CPCoding)

- (id)initWithCoder:(CPCoder)aCoder
{
    self = [self init];
    
    if (self)
    {
        lat = [aCoder decodeFloatForKey:@"lat"];
        lon = [aCoder decodeFloatForKey:@"lon"];
        _sensorLat = [aCoder decodeFloatForKey:@"sensorLat"];
        _sensorLon = [aCoder decodeFloatForKey:@"sensorLon"];
        
        street = [aCoder decodeObjectForKey:@"street"];
        area = [aCoder decodeObjectForKey:@"area"];
        city = [aCoder decodeObjectForKey:@"city"];
        region = [aCoder decodeObjectForKey:@"region"];
        country = [aCoder decodeObjectForKey:@"country"];
        postal = [aCoder decodeObjectForKey:@"postal"];
    }
    
    return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder
{
    [aCoder encodeFloat:lat forKey:@"lat"];
    [aCoder encodeFloat:lon forKey:@"lon"];
    [aCoder encodeFloat:_sensorLat forKey:@"sensorLat"];
    [aCoder encodeFloat:_sensorLon forKey:@"sensorLon"];
    
    [aCoder encodeObject:street forKey:@"street"];
    [aCoder encodeObject:area forKey:@"area"];
    [aCoder encodeObject:city forKey:@"city"];
    [aCoder encodeObject:region forKey:@"region"];
    [aCoder encodeObject:country forKey:@"country"];
    [aCoder encodeObject:postal forKey:@"postal"];
}

@end
