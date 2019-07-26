//
//  GoalColor.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

enum GoalColor {
    case red
    case orange
    case green
    case turquoise
    case clearBlue
    case cyan
    case purple
    case violet
    
    var startingColor: UIColor {
        switch self {
        case .red:          return .darkishPink
        case .orange:       return .dustyOrange
        case .green:        return .mediumGreen
        case .turquoise:    return .turquoiseBlue
        case .clearBlue:    return .clearBlue
        case .cyan:         return .clearBlueTwo
        case .purple:       return .burple
        case .violet:       return .violet
        }
    }
    
    var endingColor: UIColor {
        switch self {
        case .red:          return .salmon
        case .orange:       return .goldenYellow
        case .green:        return .kiwiGreen
        case .turquoise:    return .greenishCyan
        case .clearBlue:    return .clearBlue
        case .cyan:         return .cyan
        case .purple:       return .dodgerBlue
        case .violet:       return .candyPink
        }
    }
}

extension GoalColor: CaseIterable {}
