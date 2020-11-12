//
//  WeatherViewController.swift
//  vmwareTravel
//
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet var labelTemperature: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = WeatherAPI()
        api.getWeather { (weatherData) in
            if let weatherData = weatherData, let temp = weatherData.temperature {
                // If we have weatherData and a temperature inside
                self.labelTemperature.text = "\(temp) ⁰F"
            } else {
                // No weatherData available (==nil), so it's an error
                self.labelTemperature.text = "Error 😞"
            }
            
        }
    }


}
