//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Morteza Araby on 2016-10-06.
//  Copyright © 2016 Morteza Araby. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName : String {
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    var date : String {
        if _date == nil{
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType : String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    var currentTemp : Double {
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alomofire download
    let currentWeatehrURL = URL(string: CURRENT_WEATHER_URL)
        
        Alamofire.request(currentWeatehrURL!).responseJSON { response in
            let result = response.result
            if let dict = result.value as? JSONDictionary {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                if let weather = dict["weather"] as? [JSONDictionary] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                    
                }
                if let main = dict["main"] as? JSONDictionary {
                    if let currentTemp = main["temp"] as? Double {
                        /*let kelvinToFarenheithPreDivision = (currentTemp * (9/5) - 459.67)
                        let kelvinToFarenheith = Double(round(10*kelvinToFarenheithPreDivision/10))
                        self._currentTemp = kelvinToFarenheith
                         */
                        let kelvintToCelcius = (currentTemp - 273.15)
                        self._currentTemp = kelvintToCelcius
                        print(self._currentTemp)
                    }
                }
                
            }
            completed()
        }
        
    }
    
    
}
