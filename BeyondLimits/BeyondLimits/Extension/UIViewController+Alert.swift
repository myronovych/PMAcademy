//
//  UIViewController+Alert.swift
//  BeyondLimits
//
//  Created by Oleksandr Myronovych on 24.12.2020.
//

import UIKit


extension UIViewController {
    
    func presentGFAlert(titleText: String, message: String, buttonText: String) {
        DispatchQueue.main.async {
            let ac = AlertViewController(titleText: titleText, message: message, buttonText: buttonText)
            
            ac.modalPresentationStyle = .overFullScreen
            ac.modalTransitionStyle = .crossDissolve
            
            self.present(ac, animated: true)
        }
    }
    
}
