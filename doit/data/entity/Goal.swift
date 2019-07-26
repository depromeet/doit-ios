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
    let subtitle: String?
    let percentage: Int?
    let start: Date?
    let end: Date?
    let usesTimer: Bool?
    // TODO - Week
    let numberOfContestants: Int?
    let penalty: Int? // in won
    let color: String?
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
