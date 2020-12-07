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
        enteringField.placeholder = "2..90"
        configureTable()
    }
    
    override func goButtonPressed() {
        fibonacci.cachedValues = [0:0, 1:1]
        guard let num = Int(enteringField.text ?? "0"), num >= 0, num <= 90 else {
            let ac = UIAlertController(title: "Invalid input", message: "Enter number from 0 to 90", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            return
        }
        
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
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    
    
}


