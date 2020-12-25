//
//  UIView+Animations.swift
//  Task2Animations
//
//  Created by Oleksandr Myronovych on 25.12.2020.
//

import UIKit

extension UIView {
    func changeColor(to color: UIColor, duration: TimeInterval,
                     options: UIView.AnimationOptions) {
      UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
        self.backgroundColor = color
      }, completion: nil)
    }
}
