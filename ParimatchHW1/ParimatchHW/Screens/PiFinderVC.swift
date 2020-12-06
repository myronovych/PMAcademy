//
//  PiFinderVC.swift
//  ParimatchHW
//
//  Created by rs on 05.12.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class PiFinderVC: LabelOutputVC {

    let piFinder = PiFinder()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Pi Finder"
    }
    
    override func goButtonPressed() {
        guard let str = enteringField.text, let num = Int(str) else { return }
        
        resultLabel.text = String(piFinder.findNIndex(n: num))
    }

}
