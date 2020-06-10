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
    
    weak var tenkiVcDelegate: TenkiViewControllerDelegate?
    private let tenkiCeo = TenkiCeo()
    
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
            activityIndicator.startAnimating()
            errorStatus(errorMessage: "\(TenkiErrors.emptyCityfield.localizedDescription)")
                                         // print("City cannot be empty, try again!")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.activityIndicator.stopAnimating()
            }
            return
        }
        
        backendSearching(citi: citiText)
    }
    
    private func backendSearching(citi: String) {
        
        activityIndicator.startAnimating()
        view.endEditing(true)
        tenkiCeo.pulldownTenki(cityName: citi) { [weak self] (result) in
            
            guard let unwrappedSelf = self else { return }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                unwrappedSelf.activityIndicator.stopAnimating()
            }
                          
            switch result {
            case .success(let mod):
                unwrappedSelf.successStatus(mod: mod)
            case .failure(let error):
                unwrappedSelf.errorStatus(errorMessage: error.localizedDescription)
           //   unwrappedSelf.errorStatus(errorMessage: "Invalid city, try again!")
            }
        }
    }
    
    private func successStatus(mod: TenkiMod) {
        statusLabel.textColor = .green
        statusLabel.text = "Success!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.statusLabel.isHidden = false
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.tenkiVcDelegate?.alreadyUpdatedTenkiFromSearch(tenkiMod: mod)
        }
    }
    
    private func errorStatus(errorMessage: String) {
        statusLabel.text = errorMessage
        statusLabel.textColor = .red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                   self.statusLabel.isHidden = false
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
                     
