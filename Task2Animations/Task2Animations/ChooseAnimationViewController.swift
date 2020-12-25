//
//  ChooseAnimationViewController.swift
//  Task2Animations
//
//  Created by Oleksandr Myronovych on 25.12.2020.
//

import UIKit

class ChooseAnimationViewController: UIViewController {
    
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let fourthButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpFirstButton()
        setupSecondButton()
        setupThirdButton()
        setupFourthButton()
    }
    
    
    private func setUpFirstButton() {
        view.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        firstButton.setTitle("First animation", for: .normal)
        firstButton.backgroundColor = .black
        
        firstButton.addTarget(self, action: #selector(showFirstAnimation), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            firstButton.widthAnchor.constraint(equalToConstant: 160),
            firstButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupSecondButton() {
        view.addSubview(secondButton)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        
        secondButton.setTitle("Second animation", for: .normal)
        secondButton.backgroundColor = .black
        
        secondButton.addTarget(self, action: #selector(showSecondAnimation), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            secondButton.widthAnchor.constraint(equalToConstant: 160),
            secondButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupThirdButton() {
        view.addSubview(thirdButton)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        
        thirdButton.setTitle("Third animation", for: .normal)
        thirdButton.backgroundColor = .black
        
        thirdButton.addTarget(self, action: #selector(showThirdAnimation), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10),
            thirdButton.widthAnchor.constraint(equalToConstant: 160),
            thirdButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupFourthButton() {
        view.addSubview(fourthButton)
        fourthButton.translatesAutoresizingMaskIntoConstraints = false
        
        fourthButton.setTitle("Fourth animation", for: .normal)
        fourthButton.backgroundColor = .black
        
        fourthButton.addTarget(self, action: #selector(showFourthAnimation), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            fourthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fourthButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 10),
            fourthButton.widthAnchor.constraint(equalToConstant: 160),
            fourthButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func showFirstAnimation() {
        let destVC = FirstAnimation()
        show(destVC, sender: self)
    }
    
    @objc private func showSecondAnimation() {
        let destVC = SecondAnimation()
        show(destVC, sender: self)
    }
    
    @objc private func showThirdAnimation() {
        let destVC = ThirdAnimation()
        show(destVC, sender: self)
    }
    
    @objc private func showFourthAnimation() {
        let destVC = FourthAnimation()
        show(destVC, sender: self)
    }
    
}
