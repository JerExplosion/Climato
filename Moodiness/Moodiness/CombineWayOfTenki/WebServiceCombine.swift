//
//  WebServiceCombine.swift
//  Moodiness
//
//  Created by Jerry Ren on 12/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import Combine

struct WebServiceCombine {
    
    private let moodinessAPIKey = GloballyUsed.moodinessAPIKey
    
    internal func fetchingWeatherCombine() -> AnyPublisher<WeatherCombine, Error> {
        // internal is useless, just for fun
        print("combine's fetching called")
              
        let path = GloballyUsed.openTenkiPath
        let encodedCityName = "atlanta".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "atlanta"
        let urlString = String(format: path, encodedCityName, moodinessAPIKey)
        guard let url = URL(string: urlString) else {
            print("invalid url bruh")
            fatalError("is fatalerror dangerous here?")
        }                 
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponseCombine.self, decoder: JSONDecoder.init())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}            
      
