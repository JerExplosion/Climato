//
//  NauticaManager.swift
//  Moodiness
//
//  Created by Jerry Ren on 6/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import CoreLocation
import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherCeo: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=b7a21831bd8e760428ed45a72db858c2&units=metric"
    
    var delegate:  WeatherManagerDelegate
    
    func getchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func getchWeatherWithLatLont(lati: CLLocationDegrees, longti: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(lati)&lon=\(longti)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // blablablablabla
    }
    
}     
