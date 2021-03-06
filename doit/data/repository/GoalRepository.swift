//
//  GoalRepository.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift

class GoalRepository {
    
    static let shared = GoalRepository()
    
    func create(goalRequest: GoalRequest) -> Completable {
        
        // Add member ID
        var mutableGoalRequest = goalRequest
        mutableGoalRequest.memberId = SettingsProvider.shared.memberId
        
        return GoalService.shared.create(goalRequest: mutableGoalRequest)
            .asCompletable()
    }
    
    
    func getList() -> Single<[JoinedGoal]> {
        
        let memberId = SettingsProvider.shared.memberId
        return GoalService.shared.fetchList(memberId: memberId)
    }
    
    func getDetail(for id: Int) -> Single<JoinedGoal> {
        
        return GoalService.shared.fetchDetail(goalId: id)
    }
}
