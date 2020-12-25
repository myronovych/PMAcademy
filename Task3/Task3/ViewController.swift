//
//  ViewController.swift
//  Task3
//
//  Created by Oleksandr Myronovych on 25.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var circle = UIView()
    let colors: [UIColor] = [.yellow, .orange, .red, .blue, .green, .purple]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        addSwipes()
        addTaps()
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case .right:
                UIView.animate(withDuration: 1.5) {
                    self.circle.center.x = self.circle.center.x + 30
                    self.changeColorFor(self.circle)
                }
                print("Swiped right")
            case .down:
                UIView.animate(withDuration: 1.5) {
                    self.circle.center.y = self.circle.center.y + 30
                    self.changeColorFor(self.circle)
                }
                print("Swiped down")
            case .left:
                UIView.animate(withDuration: 1.5) {
                    self.circle.center.x = self.circle.center.x - 30
                    self.changeColorFor(self.circle)
                }
                print("Swiped left")
            case .up:
                UIView.animate(withDuration: 1.5) {
                    self.circle.center.y = self.circle.center.y - 30
                    self.changeColorFor(self.circle)
                }
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    
    private func addSwipes() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    private func addTaps() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(respondToTap))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(respondToTap))
        tapGesture.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTapGesture)
        
        doubleTapGesture.require(toFail: tapGesture)
    }
    
    @objc func respondToTap(_ gesture: UITapGestureRecognizer) {
        switch gesture.numberOfTapsRequired {
        case 1:
            UIView.animate(withDuration: 1.5) {
                self.circle.center.x = self.view.center.x
                self.circle.center.y = self.view.center.y
            }
            print("One tap")
        case 2:
                        doubleTap()
            print("Double tap")

        default:
            break
        }
    }
    
    private func doubleTap() {
        UIView.animate(withDuration: 1.5, animations: {
            self.circle.center.x = self.view.center.x
            self.circle.center.y = self.view.center.y
        }) { _ in
            let center = CGPoint(x: self.circle.center.x, y: self.circle.center.y + 80)
            let circlePath = UIBezierPath(arcCenter: center, radius: 80, startAngle: -.pi/2, endAngle: .pi*3/2, clockwise: true)
            let anim: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
            anim.path = circlePath.cgPath
            anim.duration = 3
            self.circle.layer.add(anim, forKey: nil)
        }
        
    }
    
    private func setUp() {
        view.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.layer.cornerRadius = 20
        circle.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circle.heightAnchor.constraint(equalToConstant: 40),
            circle.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func changeColorFor(_ view: UIView) {
        view.backgroundColor = colors.randomElement()
    }
}

