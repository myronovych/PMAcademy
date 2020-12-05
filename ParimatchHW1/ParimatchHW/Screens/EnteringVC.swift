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
    let enterNLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        setUpViews()
    }
    
    private func setUpViews() {
        setEnterNLabel()
        setUpEnteringField()
    }
    
    private func setUpEnteringField() {
        view.addSubview(enteringField)
        enteringField.translatesAutoresizingMaskIntoConstraints = false
        
        enteringField.backgroundColor = .white
        enteringField.font = UIFont(name: "Avenir-Black", size: enterNLabel.font.pointSize)
        enteringField.keyboardType = .numberPad
        
        NSLayoutConstraint.activate([
            enteringField.bottomAnchor.constraint(equalTo: enterNLabel.bottomAnchor),
            enteringField.leadingAnchor.constraint(equalTo: enterNLabel.trailingAnchor, constant: 10),
            enteringField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            enteringField.topAnchor.constraint(equalTo: enterNLabel.topAnchor)
        ])
        
    }
    
    private func setEnterNLabel() {
        view.addSubview(enterNLabel)
        enterNLabel.translatesAutoresizingMaskIntoConstraints = false
        
        enterNLabel.text = "Enter n: "
        enterNLabel.font = UIFont(name: "Avenir-Black", size: 35)
        enterNLabel.textColor = .yellow
        enterNLabel.adjustsFontSizeToFitWidth = true
        
        NSLayoutConstraint.activate([
            enterNLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            enterNLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            enterNLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        ])
    }

}
