//
//  NauticalData.swift
//  Moodiness
//
//  Created by Jerry Ren on 6/2/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}

// alter the name by refactorization after the VC's been built
