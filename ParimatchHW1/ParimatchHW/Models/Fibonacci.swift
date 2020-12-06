//
//  Fibonacci.swift
//  ParimatchHW
//
//  Created by rs on 05.12.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import Foundation

struct Fibonacci {
    var cachedValues = [0:0, 1:1]
    
    mutating func fib(n: Int) -> Int {
        if let value = cachedValues[n] {
            return value
        } else {
            let val = fib(n: n - 1) + fib(n: n - 2)
            cachedValues[n] = val
            return val
        }
    }
}
