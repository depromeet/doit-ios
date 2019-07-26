//
//  Member.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

struct Member: Codable {
    let id: Int?
    let name: String?
    let profileImageUrl: String?
    let progressRate: Int?
    let kakaoId: String?
    let firebaseToken: String?
        
    enum CodingKeys: String, CodingKey {
        case id = "mid"
        case name
        case profileImageUrl = "profileImgUrl"
        case progressRate
        case kakaoId
        case firebaseToken
    }
}

extension Member {
    var percentageText: String {
        guard let progressRate = progressRate else {
            return ""
        }
        return "\(progressRate) %"
    }
}
