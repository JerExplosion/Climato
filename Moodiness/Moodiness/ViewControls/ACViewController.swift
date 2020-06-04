//
//  ACViewController.swift
//  Moodiness
//
//  Created by Jerry Ren on 6/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation

class ACViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAppearance()
    }
    
    fileprivate func viewAppearance() {
        view.backgroundColor = UIColor.init(white: 0.33, alpha: 0.1)
    }
    
}   
