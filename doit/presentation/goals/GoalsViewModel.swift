//
//  GoalsViewModel.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift
import RxCocoa

class GoalsViewModel {
    
    public let goals: BehaviorRelay<[Goal]> = BehaviorRelay(value: [])
    
    func fetchGoals() {
        let mockGoals = [Goal(id: 1,
                              category: "공부",
                              title: "TOEIC 990 !",
                              subtitle: "강남 해커스 ‘월수금’ 7월반",
                              percentage: 25,
                              start: Date(),
                              end: Date(),
                              usesTimer: true,
                              numberOfContestants: 6,
                              penalty: 50000, color: "#4d90fb:#771de4"),
                         Goal(id: 2,
                              category: "운동",
                              title: "48kg",
                              subtitle: "우리의 목표",
                              percentage: 10,
                              start: Date(),
                              end: Date(),
                              usesTimer: true,
                              numberOfContestants: 6,
                              penalty: 50000, color: "#2eb144:#8add4b")]
        goals.accept(mockGoals)
    }
    
}
