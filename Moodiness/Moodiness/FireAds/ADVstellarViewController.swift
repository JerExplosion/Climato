//
//  ADVstellarViewController.swift
//  Moodiness
//
//  Created by Jerry Ren on 7/30/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ADVstellarViewController: UIViewController {
    
    var interstitial: GADInterstitial!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910") //
        // this id is standard is for test
           
        let request = GADRequest()
        interstitial.load(request)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func adsShowUp(_ sender: UIButton) {
        
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        } else {
          print("Ads weren't ready")
        }
    }
}
