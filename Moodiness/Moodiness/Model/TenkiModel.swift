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
    
}
