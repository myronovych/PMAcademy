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
    }
    
    override func goButtonPressed() {
        guard let num = Int(enteringField.text ?? "0") else { return }
        
        resultLabel.text = String(factorial.factorialIteration(n: num))
    }


}

