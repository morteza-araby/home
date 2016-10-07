//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Morteza Araby on 2016-10-06.
//  Copyright © 2016 Morteza Araby. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: JSONDictionary) {
        if let temp = weatherDict["temp"] as? JSONDictionary {
            if let min = temp["min"] as? Double{
              let kelvintToCelcius = (min.roundTo(places: 2) - 273.15)
                self._lowTemp = "\(kelvintToCelcius.roundTo(places: 1))"
            }
            if let max = temp["max"] as? Double{
                let kelvintToCelcius = (max.roundTo(places: 2) - 273.15)
                self._highTemp = "\(kelvintToCelcius.roundTo(places: 1))"
            }
        }
        
        if let weather = weatherDict["weather"] as? [JSONDictionary] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
        
        
    }
}


extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}


extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
