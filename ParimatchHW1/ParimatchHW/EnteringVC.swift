//
//  EnteringVC.swift
//  ParimatchHW
//
//  Created by rs on 05.12.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class EnteringVC: UIViewController {
    
    let enteringField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        setUpEnteringField()
    }
    
    private func setUpEnteringField() {
        view.addSubview(enteringField)
        enteringField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            enteringField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            enteringField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    

}
