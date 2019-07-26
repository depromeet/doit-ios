//
//  Router.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    case login(kakaoToken: String)
    
    // MARK: - API HTTP Method
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    // MARK: - API Paths
    var path: String {
        switch self {
        case .login:
            return "/api/member/login"
        }
    }
    
    // MARK: - API body
    var body: Data? {
        switch self {
        case .login(let kakaoToken):
            let request = LoginRequest(kakaoToken: kakaoToken)
            return try? JSONEncoder().encode(request)
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
