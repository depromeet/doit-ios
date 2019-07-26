//
//  MemberService.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift
import Alamofire

class MemberService {
    
    static let shared = MemberService()
    
    func login(kakaoToken: String) -> Single<Member> {
        return Single<Member>.create { observer in
            let utilityQueue = DispatchQueue.global(qos: .utility)
            
            let route = Router.login(kakaoToken: kakaoToken)
            let call = AF.request(route)
                .validate()
                .responseData(queue: utilityQueue) { response in
                    if let error = response.error {
                        observer(.error(error))
                        print(error)
                    }
                    guard let data = response.data else {
                        observer(.error(DoItError.responseEmpty))
                        return
                    }
                    let decoder = JSONDecoder()
                    do {
                        let response = try decoder.decode(Member.self, from: data)
                        observer(.success(response))
                    } catch {
                        observer(.error(DoItError.responseNotMappable))
                        print(error)
                    }
            }
            
            return Disposables.create() { call.cancel() }
        }
    }
    
}
