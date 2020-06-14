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
    
    private let moodinessAPIKey = GloballyUsed.moodinessAPIKey
    
    func pulldownTenki(cityName: String, completion: @escaping (Result<TenkiMod, Error>) -> Void ) {
        
        // %@ formatting
        let encodedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? cityName
        let path = GloballyUsed.openTenkiPath
        let urlString = String(format: path, encodedCityName, moodinessAPIKey)
        
        AF.request(urlString).responseDecodable(of: TenkiData.self, queue:  .main, decoder: JSONDecoder()) { (response) in
               
            switch response.result {
                
            case .success(let tenkiData):
                completion(.success(tenkiData.tenkiMod))
                
            case .failure(let error):
                if response.response?.statusCode == 404 {
                    completion(.failure(TenkiErrors.unRecognizedCity))
                } else {
                    completion(.failure(TenkiErrors.unClassfied))
                }
            }
        }
    }
}


// MARK: - By coordinates
   
extension TenkiCeo {
    func pulldownTenkiByLatLongt(lati: Double, longti: Double, completion: @escaping (Result<TenkiMod, Error>) -> Void)
       {
            
           let path = GloballyUsed.latlongtPath
           
            let urlString = String(format: path, moodinessAPIKey, lati, longti )
            
            AF.request(urlString).responseDecodable(of: TenkiData.self, queue: .main, decoder: JSONDecoder()) { (response) in
                   
                switch response.result {
                    
                case .success(let tenkiData):
                    completion(.success(tenkiData.tenkiMod))
                    
                case .failure(let error):
                    if response.response?.statusCode == 404 {
                        completion(.failure(TenkiErrors.unRecognizedCity))
                    } else {
                        completion(.failure(TenkiErrors.unClassfied))
                    }
                }
            }
       }
}
 
