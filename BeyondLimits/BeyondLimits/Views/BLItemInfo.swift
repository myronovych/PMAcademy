//
//  BLItemInfo.swift
//  BeyondLimits
//
//  Created by Oleksandr Myronovych on 20.12.2020.
//

import UIKit

enum ItemInfoType {
    case videos, hearts, games, wins
}

class BLItemInfo: UIView {
    
    var iconImageView = UIImageView()
    var titleLabel = BLTitleLabel(textAlignment: .left, fontSize: 20)
    var countLabel = BLTitleLabel(textAlignment: .center, fontSize: 20)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.tintColor = .black
        iconImageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 25),
            iconImageView.widthAnchor.constraint(equalToConstant: 25),
            
            titleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            countLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 5),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, count: Int) {
        switch itemInfoType {
        case .videos:
            iconImageView.image = UIImage(named: "video-icon")
            titleLabel.text = LocalizedStrings.videos
        case .hearts:
            iconImageView.image = UIImage(named: "heart-icon")
            titleLabel.text = LocalizedStrings.hearts
        case .games:
            iconImageView.image = UIImage(named: "game-icon")
            titleLabel.text = LocalizedStrings.games
        case .wins:
            iconImageView.image = UIImage(named: "win-icon")
            titleLabel.text = LocalizedStrings.videos
        }
        countLabel.text = String(count)
    }
}
