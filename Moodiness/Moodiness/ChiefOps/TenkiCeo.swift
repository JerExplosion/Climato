//
//  TenkiCeo.swift
//  Moodiness
//
//  Created by Jerry Ren on 6/1/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Alamofire
import UIKit

struct TenkiCeo {
    
    private let moodinessAPIKey = "32f834d6f992fc6339fcf1c341eb0b28"
    
    func pulldownTenki(cityName: String, completion: @escaping (Result<TenkiMod, Error>) -> Void ) {
        
        // %@ formatting
        let encodedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? cityName
        let path = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@&units=metric"
        let urlString = String(format: path, encodedCityName, moodinessAPIKey)
        
        AF.request(urlString).responseDecodable(of: TenkiData.self, queue:  .main, decoder: JSONDecoder()) { (response) in
               
            switch response.result {
            case .success(let tenkiData):
                completion(.success(tenkiData.tenkiMod))
                
                print(tenkiData)
                print(" ------------------ separator -----------")
                print(tenkiData.tenkiMod)
                
            case .failure(let error):
                completion(.failure(error ))
            }
        }
    }
}
       
 
