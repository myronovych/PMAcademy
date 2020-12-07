//
//  TableOutputVC.swift
//  ParimatchHW
//
//  Created by rs on 05.12.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class TableOutputVC: EnteringVC {

    let tableView = UITableView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableOutput()
    }
    
    private func setTableOutput() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .black
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.yellow.cgColor
        tableView.layer.cornerRadius = 5
        tableView.separatorColor = .yellow
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: enterNLabel.bottomAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
}
