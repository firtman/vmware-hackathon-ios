//
//  WeatherAPI.swift
//  vmwareTravel
//
//

import Foundation
import Alamofire

class WeatherAPI {
    
    func getWeather(callback: @escaping (Weather?)->Void) {
        // We need to convert spaces and special characters into a URL-valid format
        let cityName = "Palo Alto".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName!)&appid=0685c4e8066b577d449babf619cf4ab4&units=imperial"
        
        AF.request(url)
            .responseJSON { response in
            
                if response.error != nil {
                    callback(nil) // Error
                } else {
                    let json = response.value as! [String: Any]
                    // The temperature is inside the JSON within main.temp
                    // We first get the main dictionary, and then the temp value from it
                    if let main = json["main"] as? [String: Any] {
                        let temperature = main["temp"] as? Double ?? -200 // -200 it's an error
                        let weather = Weather()
                        weather.cityName = json["name"] as? String
                        weather.temperature = temperature
                        
                        // We callback with the weather
                        callback(weather)
                    } else {
                        callback(nil) // Error
                    }
                }
            }
    }
}
