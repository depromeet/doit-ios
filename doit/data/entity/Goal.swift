//
//  Goal.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

struct Goal: Codable {
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
//    var progressType: Int? = 1
    
    enum CodingKeys: String, CodingKey {
        case id = "gid"
        case category
        case title = "goalName"
        case subtitle
        case percentage = "progressRate"
        case start = "epochStartDate"
        case end = "epochEndDate"
        case usesTimer = "timerCheck"
        case numberOfContestants = "memberCount"
        case penalty
        case color = "themeColor"
        case memberId = "mid"
        case progressCount = "progressCheckCount"
//        case progressType = "progressCheckType"
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

extension Goal {
    var startingColor: UIColor? {
        let hexString = String(color?.split(separator: ":").first ?? "#000000")
        return UIColor(hexString: hexString)
    }
    
    var endingColor: UIColor? {
        let hexString = String(color?.split(separator: ":").last ?? "#000000")
        return UIColor(hexString: hexString)
    }
    
    var percentageText: String {
        guard let percentage = percentage else {
            return "0%"
        }
        
        if percentage > 100 {
            return "100%"
        } else if percentage < 0 {
            return "0%"
        } else {
            return "\(percentage)%"
        }
    }
    
    var dateText: String {
        guard
            let start = start,
            let end = end else {
                return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.MM.dd"
        return "\(dateFormatter.string(from: start)) - \(dateFormatter.string(from: end))"
    }
    
    var daysLeftText: String {
        return "D-10"
    }
    
    var penaltyText: String {
        guard let penalty = penalty else { return "" }
        return "\(penalty.decimalFormat)"
    }
}
