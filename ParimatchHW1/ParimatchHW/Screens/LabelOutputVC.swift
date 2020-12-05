//
//  LabelOutputVC.swift
//  ParimatchHW
//
//  Created by rs on 05.12.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class LabelOutputVC: EnteringVC {
    
    let answerLabel = UILabel()
    let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAnswerLabel()
        setUpResultLabel()
    }
    
    func setUpAnswerLabel() {
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        answerLabel.text = "Answer: "
        answerLabel.font = UIFont(name: "Avenir-Black", size: 35)
        answerLabel.textColor = .yellow
        
        NSLayoutConstraint.activate([
            answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            answerLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            answerLabel.topAnchor.constraint(equalTo: enterNLabel.bottomAnchor, constant: 100)
        ])
    }

    func setUpResultLabel() {
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resultLabel.text = "-"
        resultLabel.font = UIFont(name: "Avenir-Black", size: 35)
        resultLabel.textColor = .gray
        
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: answerLabel.trailingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            resultLabel.topAnchor.constraint(equalTo: answerLabel.topAnchor)
        ])
    }
    

}
