//
//  GloballyUsed.swift
//  Moodiness
//
//  Created by Jerry Ren on 6/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct GloballyUsed {
    static let openTenkiPath = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@&units=metric"
    static let showACsegue = "showAC"
    static let moodinessAPIKey = "32f834d6f992fc6339fcf1c341eb0b28"
    
    
    static let latlongtPath = "https://api.openweathermap.org/data/2.5/weather?appid=%@&units=metric&lat=%f&lon=%f"
    
    // MARS: -
    
    static let stellarVCID = "ADVstellarViewController"
    static let interstitialVCID = "ADVinterstitialViewController"
    static let bannerVCID = "ADVbannerViewController"
}

enum TenkiErrors: Error, LocalizedError {
    
    case unClassfied
    case unRecognizedCity
    case emptyCityfield
    
    var errorDescription: String? {
        switch self {
        case .emptyCityfield:
            return "City cannot be empty, try again!"
        case .unClassfied:
            return "Highly unclassfied error bud"
        case .unRecognizedCity:
            return "Unrecognized city, try again!"
        }
    }
}
