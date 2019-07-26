//
//  Numeric.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import Foundation

extension Numeric {
    var decimalFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        guard let number = self as? NSNumber else {
            return ""
        }
        
        guard let string = formatter.string(from: number) else {
            return ""
        }
        
        return string
    }
}

