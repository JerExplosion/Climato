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
          
        tenkiCeo.pulldownTenki(cityName: "longyearbyen") { [weak self] (result) in
            
            guard let unRetainedSelf = self else { return }
            switch result {
            case .success(let tenkiMod):
                unRetainedSelf.refreshView(with: tenkiMod)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func refreshView(with tenkiMod: TenkiMod) {
        ceaseAnims()
        
        ambienceLabel.text = tenkiMod.conditionDescription
        temperamentLabel.text = String(format: "%.1f", tenkiMod.temp) + "°C"
        print(String(format: "%.1f", tenkiMod.temp))
        navigationItem.title = tenkiMod.bashoString
        ambienceImageView.image = UIImage(named: tenkiMod.correspondingImage )
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

         

