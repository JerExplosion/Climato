//
//  ViewController.swift
//  Moodiness
//
//  Created by Jerry Ren on 5/31/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
    
import SkeletonView
import CoreLocation
import UIKit

class TenkiViewController: UIViewController {
    
    @IBOutlet weak var ambienceImageView: UIImageView!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var ambienceLabel: UILabel!
    
    let tenkiCeo = TenkiCeo()
    
    private lazy var locationCeo: CLLocationManager = {
        let Ceo = CLLocationManager()
        Ceo.delegate = self
        return Ceo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skeleAnim()
        pulldownTenki()
    }
    
    private func pulldownTenki() {
          
        tenkiCeo.pulldownTenki(cityName: "longyearbyen") { [weak self] (result) in
            
            guard let unRetainedSelf = self else { return }
            switch result {
            case .success(let tenkiMod):
                unRetainedSelf.refreshView(with: tenkiMod, in: 0.6)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }    
    }
    
    func refreshView(with tenkiMod: TenkiMod, in howlong: Double) {
        
        navigationItem.title = tenkiMod.bashoString
        ambienceLabel.text = tenkiMod.conditionDescription
        ambienceImageView.image = UIImage(named: tenkiMod.correspondingImage)

        DispatchQueue.main.asyncAfter(deadline: .now() + howlong, execute: { [weak self] in
            guard let thisSelf = self else { return }
            thisSelf.ceaseAnims()
            thisSelf.temperamentLabel.text = String(format: "%.1f", tenkiMod.temp) + "°C"
        })
    } // is weak self necessary here tho?

    private func skeleAnim() {
            
        temperamentLabel.showAnimatedGradientSkeleton()
        ambienceLabel.showAnimatedGradientSkeleton()
        ambienceImageView.showAnimatedGradientSkeleton()
    }
    
    private func ceaseAnims() {
        temperamentLabel.hideSkeleton()
        ambienceLabel.hideSkeleton()
        ambienceImageView.hideSkeleton()
        // ambienceImageView.showAnimatedGradientSkeleton()
    }
    
    
    @IBAction func bashoButtonTapped(_ sender: UIBarButtonItem) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            locationCeo.requestLocation()
        case .notDetermined:
            locationCeo.requestWhenInUseAuthorization()
            locationCeo.requestLocation()
        default:
            alertingForLocationPermission()
        }
    }

    @IBAction func additionTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: GloballyUsed.showACsegue, sender: nil )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == GloballyUsed.showACsegue {
            
            if let segueDestination = segue.destination as? ACViewController {
                segueDestination.tenkiVcDelegate = self
            }
        }
    }
}

protocol TenkiViewControllerDelegate: class {
    func alreadyUpdatedTenkiFromSearch(tenkiMod: TenkiMod)
}

extension TenkiViewController: TenkiViewControllerDelegate {
    
    func alreadyUpdatedTenkiFromSearch(tenkiMod: TenkiMod) {
        skeleAnim()
        presentedViewController?.dismiss(animated: true, completion: { [weak self] in
            guard let self = self else { return }
            self.refreshView(with: tenkiMod, in: 0.1) //time open for micro-adjustation
        })
    }
    
}
