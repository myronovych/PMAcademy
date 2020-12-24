//
//  GamesVC.swift
//  BeyondLimits
//
//  Created by Oleksandr Myronovych on 24.12.2020.
//

import UIKit

class GamesVC: CheckStatsVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInfoItems()
    }
    
    private func configureInfoItems() {
        leftItem.set(itemInfoType: .games, count: counter)
        rightItem.set(itemInfoType: .wins, count: counter)
    }

}
