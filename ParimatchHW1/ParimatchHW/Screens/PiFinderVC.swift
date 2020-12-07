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
        enteringField.placeholder = "0..13"
    }
    
    override func goButtonPressed() {
        
        guard let str = enteringField.text, let num = Int(str), num >= 0, num < 14 else {
            let ac = UIAlertController(title: "Invalid input", message: "Enter number from 0 to 13", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            return
        }
        
        resultLabel.text = String(piFinder.findNIndex(n: num))
    }

}
