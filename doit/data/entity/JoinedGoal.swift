//
//  JoinedGoal.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

struct JoinedGoal: Codable {
    let goal: Goal?
    let joined: Bool?
    let members: [Member]?
    
    enum CodingKeys: String, CodingKey {
        case goal
        case joined
        case members = "memberDtoList"
    }
}
