//
//  Factorial.swift
//  ParimatchHW
//
//  Created by rs on 05.12.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import Foundation

struct Factorial {
    
    func factorialRecursive(n: Int) -> Int {
        if n == 0 {
            return 1
        } else {
            return n * factorialRecursive(n: n - 1)
        }
    }
    
    func factorialIteration(n: Int) -> Int {
        
        var k = n
        var result = 1
        
        while k > 1 {
            result = k * result
            k -= 1
        }
        
        return result
    }
}
