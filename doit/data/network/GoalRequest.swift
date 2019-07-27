//
//  GoalRequest.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

struct GoalRequest: Codable {
    let id: Int?
    var category: String?
    var title: String?
    var subtitle: String?
    var percentage: Int?
    var start: Date?
    var end: Date?
    var usesTimer: Bool?
    // TODO - Week
    var numberOfContestants: Int?
    var penalty: Int? // in won
    var color: String?
    var memberId: Int?
    var progressCount: Int? = 0
    var progressType: Int? = 1
    
    enum CodingKeys: String, CodingKey {
        case id = "gid"
        case category
        case title = "name"
        case subtitle
        case percentage
        case start = "startDate"
        case end = "endDate"
        case usesTimer = "timerCheck"
        case numberOfContestants = "memberCount"
        case penalty
        case color
        case memberId = "mid"
        case progressCount
        case progressType
    }
    
    init(id: Int? = nil,
         category: String? = nil,
         title: String? = nil,
         subtitle: String? = nil,
         percentage: Int? = nil,
         start: Date? = nil,
         end: Date? = nil,
         usesTimer: Bool? = nil,
         numberOfContestants: Int? = nil,
         penalty: Int? = nil,
         color: String? = nil,
         memberId: Int? = nil) {
        self.id = id
        self.category = category
        self.title = title
        self.subtitle = subtitle
        self.percentage = percentage
        self.start = start
        self.end = end
        self.usesTimer = usesTimer
        self.numberOfContestants = numberOfContestants
        self.penalty = penalty
        self.color = color
    }
}
