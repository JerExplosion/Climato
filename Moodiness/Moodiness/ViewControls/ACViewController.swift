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
    
    @IBOutlet weak var citiTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAppearance()
   //     citiTextField.becomeFirstResponder()
    }
    
    @IBAction func searchingInAction(_ sender: UIButton) {

    }
    
    fileprivate func viewAppearance() {
        view.backgroundColor = UIColor.init(white: 0.33, alpha: 0.1) 
    }
    
}   
