//
//  CoreLocationCeo.swift
//  Moodiness
//
//  Created by Jerry Ren on 6/11/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import CoreLocation
import UIKit

extension TenkiViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let mostRecentLocation = locations.first {
            manager.stopUpdatingLocation()
            let latitude = mostRecentLocation.coordinate.latitude
            let longitude = mostRecentLocation.coordinate.longitude
            print(longitude, latitude) // guess the default is cupertino haha
            
            tenkiCeo.pulldownTenkiByLatLongt(lati: latitude, longti: longitude) { (result) in
                
                switch result {
                case .success(let tenkiModel):
                    DispatchQueue.main.async {
                        self.refreshView(with: tenkiModel, in: 0.0)
                    }
                case .failure(let error):
                    print(error.localizedDescription )
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {  }

}

extension TenkiViewController {
    
    func alertingForLocationPermission() {
        let locationAlertController = UIAlertController(title: "Requesting Location Permission", message: "Would you like to enable location services?", preferredStyle: .alert)
        // the actual message is in info.plist under
        // "Privacy - Location When In Use Usage Description"
        
        let actionToEnable = UIAlertAction(title: "Go to Settings", style: .default) { (_) in
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString)
                else { return }
            
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }
        
        let actionToNotEnable = UIAlertAction(title:  "Cancel", style: .cancel, handler:  nil)
        
        locationAlertController.addAction(actionToEnable)
        locationAlertController.addAction(actionToNotEnable)
        
        self.present(locationAlertController, animated: true, completion: nil)
    }
}

