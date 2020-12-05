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
        viewControllers = [setUpFactorialVC(), setUpFibonacciVC(), setUpPiFinderVC()]
    }
    
    
    func setUpFactorialVC() -> UIViewController {
        let icon = UITabBarItem(title: "Factorial", image: UIImage(systemName: "exclamationmark.circle"), selectedImage: UIImage(systemName: "exclamationmark.circle.fill"))
        
        return setUpVC(vc: FactorialVC(), icon: icon)
    }
    
    func setUpPiFinderVC() -> UIViewController {
        let icon = UITabBarItem(title: "Pi finder", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        
        return setUpVC(vc: PiFinderVC(), icon: icon)
    }
    
    func setUpFibonacciVC() -> UIViewController {
        let icon = UITabBarItem(title: "Fibonacci", image: UIImage(systemName: "florinsign.circle"), selectedImage: UIImage(systemName: "florinsign.circle.fill"))
        
        return setUpVC(vc: FibonacciVC(), icon: icon)
    }
    
    func setUpVC(vc: UIViewController, icon: UITabBarItem) -> UIViewController {
        vc.tabBarItem = icon

        let navController = UINavigationController(rootViewController: vc)
        navController.navigationBar.tintColor = .black
        navController.navigationBar.barTintColor = .yellow
        
        return navController
    }
    func setUpTabBarView() {
        tabBar.barTintColor = .yellow
        tabBar.tintColor = .black
    }
    
}
