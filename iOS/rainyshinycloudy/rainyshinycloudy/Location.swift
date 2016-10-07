//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Morteza Araby on 2016-10-07.
//  Copyright © 2016 Morteza Araby. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
    
}
