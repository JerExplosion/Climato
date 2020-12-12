//
//  CombineTenkiViewCExtension.swift
//  Moodiness
//
//  Created by Jerry Ren on 12/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Combine
import UIKit

//extension TenkiViewController {
//    
//    internal func combineDisplayAssignToTemperamentLabel() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.3) {
//            self.temperamentLabel.font = self.temperamentLabel.font.withSize(22)
//            self.cancellable =
//                self.webserviceCombine.fetchingWeatherCombine()
//                .catch { _ in
//                    Just(WeatherCombine.pholder)
//                }
//                .catch({_ in
//                    Just(WeatherCombine.pholder)
//                })
//                .map {
//                    guard let tempa = $0.temp else { return "tempa fetching erro"}
//                    return  "\(tempa) the combine way"
//                }
//                .assign(to: \.text, on: self.temperamentLabel)
//        }
//    }
//}

