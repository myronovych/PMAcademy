//
//  VideosVC.swift
//  BeyondLimits
//
//  Created by Oleksandr Myronovych on 24.12.2020.
//

import UIKit

class VideosVC: CheckStatsVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInfoItems()
    }
    
    private func configureInfoItems() {
        leftItem.set(itemInfoType: .videos, count: Constants.counter)
        rightItem.set(itemInfoType: .hearts, count: Constants.counter)
    }
    
}
