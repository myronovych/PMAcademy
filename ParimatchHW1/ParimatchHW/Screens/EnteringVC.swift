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
    let goButton = UIButton()
    let logoView = UIImageView(image: UIImage(named: "pm_logo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setUpViews()
        goButton.addTarget(nil, action: #selector(goButtonPressed), for: .touchUpInside)
    }
    
    private func setUpViews() {
        setUpLogo()
        setEnterNLabel()
        setUpEnteringField()
        setGoButton()
    }
    
    private func setUpLogo() {
        view.addSubview(logoView)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logoView.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func setUpEnteringField() {
        view.addSubview(enteringField)
        enteringField.translatesAutoresizingMaskIntoConstraints = false
        
        enteringField.backgroundColor = .white
        enteringField.font = UIFont(name: "Pari-Match-Bold", size: enterNLabel.font.pointSize)
        enteringField.keyboardType = .numberPad
        enteringField.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            enteringField.bottomAnchor.constraint(equalTo: enterNLabel.bottomAnchor),
            enteringField.leadingAnchor.constraint(equalTo: enterNLabel.trailingAnchor, constant: 10),
            enteringField.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            enteringField.topAnchor.constraint(equalTo: enterNLabel.topAnchor)
        ])
        
    }
    
    private func setEnterNLabel() {
        view.addSubview(enterNLabel)
        enterNLabel.translatesAutoresizingMaskIntoConstraints = false
        
        enterNLabel.text = "Enter n: "
        enterNLabel.font = UIFont(name: "Pari-Match-Bold", size: 35)
        enterNLabel.textColor = .yellow
        enterNLabel.adjustsFontSizeToFitWidth = true
        
        NSLayoutConstraint.activate([
            enterNLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            enterNLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            enterNLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        ])
    }
    
    private func setGoButton() {
        view.addSubview(goButton)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        
        goButton.backgroundColor = .yellow
        goButton.setTitleColor(.black, for: .normal)
        goButton.setTitle("GO", for: .normal)
        goButton.titleLabel?.font = UIFont(name: "Pari-Match-Bold", size: 30)
        
        goButton.setTitleShadowColor(.red, for: .selected)
        
        NSLayoutConstraint.activate([
            goButton.leadingAnchor.constraint(equalTo: enteringField.trailingAnchor, constant: 10),
            goButton.topAnchor.constraint(equalTo: enteringField.topAnchor),
            goButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            goButton.bottomAnchor.constraint(equalTo: enteringField.bottomAnchor)
        ])
    }
    
    //override to use when 'GO' button pressed
    @objc func goButtonPressed() {
        print("LOG: GO BUTTON PRESSED")
    }
    
}
