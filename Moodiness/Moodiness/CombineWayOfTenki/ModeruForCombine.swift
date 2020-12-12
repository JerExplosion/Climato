//
//  ModeruForCombine.swift
//  Moodiness
//
//  Created by Jerry Ren on 12/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
       
struct WeatherResponseCombine: Decodable {
    let main: WeatherCombine
}
struct WeatherCombine: Decodable {
    let humidity: Double?
    let temp: Double?
    
    static var pholder: WeatherCombine {
        return WeatherCombine(humidity: nil, temp: nil)
    }
}
       
   
