//
//  AddGoalViewModel.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift
import RxCocoa

class AddGoalViewModel {
    
    private var disposeBag = DisposeBag()
    
    public var goalRequest: BehaviorRelay<GoalRequest?> = BehaviorRelay(value: nil)
    public var goalSuccessfullyCreated: PublishSubject<Void> = PublishSubject()
    
    func saveFirstStepForm(category: Category,
                           title: String,
                           startDate: Date,
                           endDate: Date,
                           isTimeEnabled: Bool) {
        
        let goalRequest = GoalRequest(category: category.labelText,
                               title: title,
                               start: startDate,
                               end: endDate,
                               usesTimer: isTimeEnabled)
        
        self.goalRequest.accept(goalRequest)
    }
    
    func saveSecondStepForm(frequency: Frequency,
                            numberOfContestants: Int,
                            penalty: Int,
                            color: GoalColor) {
        
        var mutableGoalRequest = self.goalRequest.value
        // TODO - Frequency
        mutableGoalRequest?.numberOfContestants = numberOfContestants
        mutableGoalRequest?.penalty = penalty
        mutableGoalRequest?.color = color.encodedString
        
        self.goalRequest.accept(mutableGoalRequest)
    }
    
    func requestGoalCreation() {
        guard let goalRequest = self.goalRequest.value else { return }
        GoalRepository.shared.create(goalRequest: goalRequest)
            .observeOn(MainScheduler.instance)
            .subscribe(onCompleted: { [weak self] in
                self?.goalSuccessfullyCreated.onNext(())
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}
