//
//  AlertContainerView.swift
//  BeyondLimits
//
//  Created by Oleksandr Myronovych on 24.12.2020.
//


import UIKit

class AlertContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.backgroundColor = UIColor.systemBackground.cgColor
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
