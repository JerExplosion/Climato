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

        dismissWhenTappingOutside()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.citiTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func searchingInAction(_ sender: UIButton) {
        statusLabel.isHidden = true
        guard let citiText = citiTextField.text, !citiText.isEmpty else {
            errorStatus(errorMessage: "City cannot be empty, try again please!")
            return
        }
        
        backendSearching(citi: citiText)
    }
    
    private func backendSearching(citi: String) {
        print(citi)
    }
    
    private func errorStatus(errorMessage: String) {
        statusLabel.isHidden = false
        statusLabel.text = errorMessage
        statusLabel.textColor = .red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            self.statusLabel.isHidden = true
        })
    }
    
    fileprivate func viewAppearance() {
        view.backgroundColor = UIColor.init(white: 0.33, alpha: 0.1)
        statusLabel.isHidden = true
    }
    
    @objc private func viewControllerRetreats() {
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func dismissWhenTappingOutside() {
        let lightTap = UITapGestureRecognizer(target: self, action: #selector(viewControllerRetreats))
        view.addGestureRecognizer(lightTap)
        lightTap.delegate = self
    }
    
}   

extension ACViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
}
