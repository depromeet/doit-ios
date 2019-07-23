//
//  Category.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

enum Category {
    case workout
    case study
    case hobby
    case savings
    case travel
    case weightloss
    case etc
    
    var labelText: String {
        switch self {
        case .workout:      return "운동"
        case .study:        return "공부"
        case .hobby:        return "취미"
        case .savings:      return "저축"
        case .travel:       return "여행"
        case .weightloss:   return "다이어트"
        case .etc:          return "기타"
        }
    }
}

extension Category: CaseIterable {}
