//
//  Router.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    case login(kakaoToken: String)
    case createGoal(goalRequest: GoalRequest)
    case goalsList(memberId: Int)
    case goalDetail(goalId: Int)
    
    // MARK: - API HTTP Method
    var method: HTTPMethod {
        switch self {
        case .login, .createGoal:
            return .post
        case .goalsList, .goalDetail:
            return .get
        }
    }
    
    // MARK: - API Paths
    var path: String {
        switch self {
        case .login:
            return "/api/member/login"
        case .createGoal:
            return "/api/goals/create"
        case .goalsList(let memberId):
            return "/api/goals/\(memberId)"
        case .goalDetail(let goalId):
            return "/api/goal/\(goalId)"
        }
    }
    
    // MARK: - API body
    var body: Data? {
        switch self {
        case .login(let kakaoToken):
            let request = LoginRequest(kakaoToken: kakaoToken)
            return try? JSONEncoder().encode(request)
            
        case .createGoal(let goalRequest):
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .custom({ (date, encoder) in
                let epochDays = Int(date.timeIntervalSince1970 / 86400)
                var container = encoder.singleValueContainer()
                try container.encode(epochDays)
            })
            return try? encoder.encode(goalRequest)
            
        default:
            return nil
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try APIBaseUrl.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        request.httpMethod = method.rawValue
        // Static Headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // Timeout values
        request.timeoutInterval = TimeInterval(10) // seconds
        // Parameters
        request.httpBody = body
        return request
    }
}
