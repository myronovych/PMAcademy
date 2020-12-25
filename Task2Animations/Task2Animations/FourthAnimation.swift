//
//  FourthAnimation.swift
//  Task2Animations
//
//  Created by Oleksandr Myronovych on 25.12.2020.
//

import UIKit

class FourthAnimation: UIViewController {
    
    let firstCircle = UIView()
    let secondCircle = UIView()
    let containerView = UIView()
    
    let startSize: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .curveLinear, .repeat], animations: {
            self.containerView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }) { _ in
            self.configure()
        }
    }
    func configure() {
        setUpView()
        setUpFirstCircle()
        setUpSecondCircle()
    }
    
    
    private func setUpView() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: startSize * 2),
            containerView.widthAnchor.constraint(equalToConstant: startSize)
        ])
    }
    
    private func setUpFirstCircle() {
        containerView.addSubview(firstCircle)
        firstCircle.translatesAutoresizingMaskIntoConstraints = false
        firstCircle.backgroundColor = .green
        firstCircle.layer.cornerRadius = 50
        
        NSLayoutConstraint.activate([
            firstCircle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 45),
            firstCircle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            firstCircle.heightAnchor.constraint(equalToConstant: startSize),
            firstCircle.widthAnchor.constraint(equalToConstant: startSize)
        ])
    }
    
    private func setUpSecondCircle() {
        containerView.addSubview(secondCircle)
        secondCircle.translatesAutoresizingMaskIntoConstraints = false
        secondCircle.backgroundColor = .blue
        secondCircle.layer.cornerRadius = 50
        
        NSLayoutConstraint.activate([
            secondCircle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -45),
            secondCircle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            secondCircle.heightAnchor.constraint(equalToConstant: startSize),
            secondCircle.widthAnchor.constraint(equalToConstant: startSize)
        ])
    }
    
}
