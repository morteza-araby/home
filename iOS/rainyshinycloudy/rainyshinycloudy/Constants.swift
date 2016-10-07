//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Morteza Araby on 2016-10-06.
//  Copyright © 2016 Morteza Araby. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let WEATHER = "weather?"
let FORECAST = "forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "92a9b0fa67934fe5f600677292ee5fc9"


typealias DownloadComplete = () -> ()

typealias JSONDictionary = [String: AnyObject]

typealias JSONArray = Array<AnyObject>


let CURRENT_WEATHER_URL = "\(BASE_URL)\(WEATHER)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "\(BASE_URL)\(FORECAST)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)&cnt=10&mode=json\(APP_ID)\(API_KEY)"
