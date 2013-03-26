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

@import <AppKit/CPImageView.j>


@implementation CPMapImage : CPImageView
{
    CPLocation          location    @accessors;
    
    // Map Properties
    CPMapStyle          mapStyle    @accessors;
    CPColor             markerColor @accessors;
    CPString            markerLabel @accessors;
    CPString            markerSize  @accessors;
}

- (void)setLocation:(CPLocation)aLocation
{
    if (location == aLocation)
        return;
    
    location = aLocation;
    
    if (location)
    {
        var mapImage = [[CPImage alloc] initWithContentsOfFile:[[self staticMapURL] absoluteString] size:[self bounds].size];
        [self setImage:mapImage];
    }
    else
        [self setImage:nil];
}

- (CPURL)staticMapURL
{
    if (!location)
        return;
    
    var url = [@"http://maps.google.com/maps/api/staticmap?key=", GMAPS_KEY, @"&sensor=true"];
    
    // Map Type
    [url addObject:@"&maptype="];
    if (mapStyle == CPMapTypeSatellite) [url addObject:@"satellite"];
    else if (mapStyle == CPMapTypeTerrain) [url addObject:@"terrain"];
    else if (mapStyle == CPMapTypeHybrid) [url addObject:@"hybrid"];
    else [url addObject:@"roadmap"];
    
    [url addObject:@"&zoom=12"];
    
    // Map Size
    [url addObjectsFromArray:[@"&size=", CGRectGetWidth([self bounds]), @"x", CGRectGetHeight([self bounds])]];
    
    // Marker
    [url addObject:@"&markers="];
    if (markerColor) [url addObjectsFromArray:[@"color:0x", [markerColor hexString], @"|"]];
    if (markerLabel) [url addObjectsFromArray:[@"label:", markerLabel, @"|"]];
    if (markerSize) [url addObjectsFromArray:[@"size:", markerSize, @"|"]];
    [url addObject:[location coords]];
    
    return [CPURL URLWithString:[url componentsJoinedByString:@""]];
}

@end
