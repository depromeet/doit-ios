//
//  Goal.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

struct Goal: Codable {
    let id: Int
    let category: String?
    let title: String?
    let start: Date?
    let end: Date?
    let usesTimer: Bool?
    // TODO - Week
    let numberOfContestants: Int?
    let penalty: Int? // in won
    let color: String?
}
