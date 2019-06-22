//
//  Date.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

extension Date {
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }    
}
