//
//  FirstAnimation.swift
//  Task2Animations
//
//  Created by Oleksandr Myronovych on 25.12.2020.
//

import UIKit

class FirstAnimation: UIViewController {
    
    let square = UIView()
    let startSize: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpSquare()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, delay: 0, options: .curveLinear) {
            self.square.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
    }
    
    private func setUpSquare() {
        view.addSubview(square)
        square.translatesAutoresizingMaskIntoConstraints = false
        square.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            square.heightAnchor.constraint(equalToConstant: startSize),
            square.widthAnchor.constraint(equalToConstant: startSize)
        ])
    }
    
}

