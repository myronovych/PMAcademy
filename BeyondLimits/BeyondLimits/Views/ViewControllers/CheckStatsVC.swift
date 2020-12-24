//
//  CheckStatsVC.swift
//  BeyondLimits
//
//  Created by Oleksandr Myronovych on 20.12.2020.
//

import UIKit

class CheckStatsVC: UIViewController {
    
    let leftItem = BLItemInfo()
    let rightItem = BLItemInfo()
    let hstack = UIStackView()
    let button = BLMainButton(title: LocalizedStrings.checkStats, backgroundColor: .red, height: 38)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackground()
        configureStack()
        configureButtonAlert()
        layoutUI()
    }
    
    
    private func configure() {
        view.backgroundColor = .red
        
    }
    
    private func configureButtonAlert() {
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    private func configureBackground() {
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func configureStack() {
        hstack.axis = .horizontal
        hstack.distribution = .equalSpacing
        hstack.addArrangedSubview(leftItem)
        hstack.addArrangedSubview(rightItem)
    }
    
    private func layoutUI() {
        view.addSubview(hstack)
        view.addSubview(button)
        
        hstack.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            hstack.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            hstack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            hstack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            hstack.heightAnchor.constraint(equalToConstant: 50),
            
            button.topAnchor.constraint(equalTo: hstack.bottomAnchor, constant: padding),
            button.leftAnchor.constraint(equalTo: hstack.leftAnchor),
            button.rightAnchor.constraint(equalTo: hstack.rightAnchor),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func showAlert() {
        presentGFAlert(titleText: LocalizedStrings.alert, message: LocalizedStrings.description, buttonText: "OK")
    }
}
