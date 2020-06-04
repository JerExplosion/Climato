//
//  ViewController.swift
//  Moodiness
//
//  Created by Jerry Ren on 5/31/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
    
import SkeletonView
import UIKit

class TenkiViewController: UIViewController {
    
    @IBOutlet weak var ambienceImageView: UIImageView!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var ambienceLabel: UILabel!
    
    private let tenkiCeo = TenkiCeo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skeleAnim()
        
        pulldownTenki()
        
    //    tenkiCeo.pulldownTenki(cityName: "guilin")
    }
    
    private func pulldownTenki() {
          
        tenkiCeo.pulldownTenki(cityName: "atlanta") { [weak self] (result) in
            
            guard let unRetainedSelf = self else { return }
            switch result {
            case .success(let tenkiDaTa):
                unRetainedSelf.refreshView(with: tenkiDaTa)
                
            case .failure(let error):
                print(error.localizedDescription )
                
            }
        }
        
    }
    
    private func refreshView(with dataModel: TenkiData) {
        
        
        ceaseAnims()
        
        temperamentLabel.text = String(format: "%.1f", dataModel.main.temp) + "°C"
        ambienceLabel.text = dataModel.weather.first?.description
        
        navigationItem.title = dataModel.name
    }

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
    }
    
    @IBAction func additionTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: GloballyUsed.showACsegue, sender: nil )
    }

}

         

