//
//  GoalService.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift
import Alamofire

class GoalService {
    
    static let shared = GoalService()
    
    func create(goalRequest: GoalRequest) -> Single<Goal> {
        return Single<Goal>.create { observer in
            let utilityQueue = DispatchQueue.global(qos: .utility)
            
            let route = Router.createGoal(goalRequest: goalRequest)
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
                        let response = try decoder.decode(Goal.self, from: data)
                        observer(.success(response))
                    } catch {
                        observer(.error(DoItError.responseNotMappable))
                        print(error)
                    }
            }
            
            return Disposables.create() { call.cancel() }
        }
    }
    
    func fetchList(memberId: Int) -> Single<[Goal]> {
        
        return Single<[Goal]>.create { observer in
            let utilityQueue = DispatchQueue.global(qos: .utility)
            
            let route = Router.goalsList(memberId: memberId)
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
                        let response = try decoder.decode([Goal].self, from: data)
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
