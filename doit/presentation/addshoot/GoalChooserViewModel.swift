//
//  GoalChooserViewModel.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift
import RxCocoa

class GoalChooserViewModel {
    
    private var disposeBag = DisposeBag()
    
    public let goals: BehaviorRelay<[JoinedGoal]> = BehaviorRelay(value: [])
    
    func fetchGoals() {
        
        GoalRepository.shared.getList()
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] goals in
                self?.goals.accept(goals)
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
        
        
    }
}
