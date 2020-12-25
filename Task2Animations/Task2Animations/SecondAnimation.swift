//
//  SecondAnimation.swift
//  Task2Animations
//
//  Created by Oleksandr Myronovych on 25.12.2020.
//

import UIKit

class SecondAnimation: UIViewController {
    
    let square = UIView()
    let circle = UIView()
    let squareSize: CGFloat = 200
    let circleSize : CGFloat = 150
    
    let squareColors: [UIColor] = [.black, .red, .green, .orange, .white]
    let circleColors: [UIColor] = [.white, .blue, .yellow, .systemPink, .black]
    
    var timer = Timer()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpSquare()
        setUpCircle()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
    }
    
    @objc func changeColor() {
        count += 1
        if (count > 4) {
            timer.invalidate()
        } else {
            square.backgroundColor = squareColors[count]
            circle.backgroundColor = circleColors[count]
        }
    }
    
    private func setUpSquare() {
        view.addSubview(square)
        square.translatesAutoresizingMaskIntoConstraints = false
        square.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            square.heightAnchor.constraint(equalToConstant: squareSize),
            square.widthAnchor.constraint(equalToConstant: squareSize)
        ])
    }
    
    private func setUpCircle() {
        view.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .white
        
        circle.layer.cornerRadius = 75
        
        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.heightAnchor.constraint(equalToConstant: circleSize),
            circle.widthAnchor.constraint(equalToConstant: circleSize)
        ])
    }
    
}
