//
//  FibonacciVC.swift
//  ParimatchHW
//
//  Created by rs on 05.12.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class FibonacciVC: TableOutputVC {
    
    var fibonacci = Fibonacci()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Fibonacci"
        configureTable()
    }
    
    override func goButtonPressed() {
        fibonacci.cachedValues = [0:0, 1:1]
        guard let num = Int(enteringField.text ?? "0") else { return }
        
        let _ = fibonacci.fib(n: num)
        tableView.reloadData()
    }
    
    private func configureTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FibonacciCell.self, forCellReuseIdentifier: "fibonacciCell")
    }

}


extension FibonacciVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fibonacci.cachedValues.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fibonacciCell", for: indexPath) as? FibonacciCell
        cell?.textLabel?.text = String(indexPath.row)
        cell?.detailTextLabel?.text = String(fibonacci.cachedValues[indexPath.row] ?? 0)
        
        return cell ?? UITableViewCell()
    }
    
}


