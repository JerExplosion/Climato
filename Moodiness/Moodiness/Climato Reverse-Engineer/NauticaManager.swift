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
    
}     
