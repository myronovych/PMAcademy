//
//  ThirdAnimation.swift
//  Task2Animations
//
//  Created by Oleksandr Myronovych on 25.12.2020.
//

import UIKit

class ThirdAnimation: UIViewController {
    
    let circle = UIView()
    let startSize: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpSquare()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, delay: 0, options: .curveLinear) {
            self.circle.layer.cornerRadius = 50
        }
    }
    
    private func setUpSquare() {
        view.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.heightAnchor.constraint(equalToConstant: startSize),
            circle.widthAnchor.constraint(equalToConstant: startSize)
        ])
    }
    
}

