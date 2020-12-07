//
//  FactorialVC.swift
//  ParimatchHW
//
//  Created by rs on 05.12.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class FactorialVC: LabelOutputVC {
    
    let factorial = Factorial()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Factorial"
        enteringField.placeholder = "0...20"
    }
    
    override func goButtonPressed() {
        guard let num = Int(enteringField.text ?? "0"), num >= 0, num <= 21 else {
            let ac = UIAlertController(title: "Invalid input", message: "Enter number from 0 to 20", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            return
        }
        
        
        resultLabel.text = String(factorial.factorialIteration(n: num))
    }
    
    
}

