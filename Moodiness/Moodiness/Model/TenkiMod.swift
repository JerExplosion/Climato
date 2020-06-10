//
//  TenkiModel.swift
//  Moodiness
//
//  Created by Jerry Ren on 6/2/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct TenkiData: Codable {
    let name: String
    let main: Elemental
    let weather: [CurrentTenki]
    
    var tenkiMod: TenkiMod {
        return TenkiMod(bashoString: name, temp: main.temp, conditionID: weather.first?.id ?? 0, conditionDescription: weather.first?.description ?? "")
    }
}

struct CurrentTenki: Codable {
    let id: Int
    let main: String
    let description: String
}

struct Elemental: Codable {
    let temp: Double
}

struct TenkiMod { 
    let bashoString: String    
    let temp: Double
    let conditionID: Int
    let conditionDescription: String
    
    var correspondingImage: String {
        
        switch conditionID {
        case 200...299:
            return "mooThunderstorm"
        case 300...399:
            return "mooLightrain"
        case 500...599:
            return "mooRain"
        case 600...699:
            return "mooSnow"
        case 700...799:
            return "mooSad"
        case 800:
            return "mooClear"
        default:
            return "mooClouds"
        }
    }
}
