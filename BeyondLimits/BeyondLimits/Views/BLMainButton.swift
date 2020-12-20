//
//  BLMainButton.swift
//  BeyondLimits
//
//  Created by Oleksandr Myronovych on 20.12.2020.
//

import UIKit

class BLMainButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(title: String, backgroundColor: UIColor, height: CGFloat) {
        self.init(frame: .zero)
        
        set(title: title, backgroundColor: backgroundColor, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(title: String, backgroundColor: UIColor, height: CGFloat) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
}
