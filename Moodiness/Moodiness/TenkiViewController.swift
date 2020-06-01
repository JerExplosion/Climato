//
//  ViewController.swift
//  Moodiness
//
//  Created by Jerry Ren on 5/31/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class TenkiViewController: UIViewController {
    
    @IBOutlet weak var ambienceImageView: UIImageView!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var ambienceLabel: UILabel!
    
    private let tenkiCeo = TenkiCeo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tenkiCeo.pulldownTenki(cityName: "guilin ")
    }
    
    @IBAction func bashoButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func additionTapped(_ sender: UIBarButtonItem) {
    }

}

