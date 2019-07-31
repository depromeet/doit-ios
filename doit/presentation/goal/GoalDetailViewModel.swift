//
//  GoalDetailViewModel.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift
import RxCocoa

class GoalDetailViewModel {
    
    private var disposeBag = DisposeBag()
    
    public let goal: BehaviorRelay<Goal?> = BehaviorRelay(value: nil)
    public let members: BehaviorRelay<[Member]> = BehaviorRelay(value: [])
    
    func fetchGoal(id: Int) {
        
        GoalRepository.shared.getDetail(for: id)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] joinedGoal in
                self?.goal.accept(joinedGoal.goal)
                
                let sortedMember = joinedGoal.members?.sorted { (lhs, rhs) -> Bool in
                    let lhsProgress = lhs.progressRate ?? 0
                    let rhsProgress = rhs.progressRate ?? 0
                    
                    return lhsProgress > rhsProgress
                }
                
                self?.members.accept(sortedMember ?? [])
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    
    }
    
    
}
