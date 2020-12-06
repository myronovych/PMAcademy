//
//  PiFinder.swift
//  ParimatchHW
//
//  Created by rs on 05.12.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import Foundation

struct PiFinder {
    func findNIndex(n: Int) -> Character {
        let piString = String(Double.pi)
        
        if n + 2 < 15, n >= 0 {
            return Array(piString)[n + 2]
        }
        
        return "-"
    }
}
