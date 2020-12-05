//
//  TasksTabBarController.swift
//  ParimatchHW
//
//  Created by rs on 05.12.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class TasksTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBarView()
        viewControllers = [setUpFactorialVC()]
    }
    
    
    func setUpFactorialVC() -> UIViewController {
        let factorialVC = EnteringVC()
        
        let icon = UITabBarItem(title: "Factorial", image: UIImage(systemName: "exclamationmark.circle"), selectedImage: UIImage(systemName: "exclamationmark.circle.fill"))
        
        factorialVC.tabBarItem = icon
        
        return factorialVC
    }
    
    func setUpTabBarView() {
        tabBar.barTintColor = .yellow
        tabBar.tintColor = .black
    }
    
}
