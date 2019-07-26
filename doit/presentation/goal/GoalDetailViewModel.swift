//
//  GoalDetailViewModel.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift
import RxCocoa

class GoalDetailViewModel {
    
    public let goal: BehaviorRelay<Goal?> = BehaviorRelay(value: nil)
    public let members: BehaviorRelay<[Member]> = BehaviorRelay(value: [])
    
    func fetchGoal() {
        let goal = Goal(id: 1,
                        category: "공부",
                        title: "TOEIC 990 !",
                        subtitle: "강남 해커스 ‘월수금’ 7월반",
                        percentage: 25,
                        start: Date(),
                        end: Date(),
                        usesTimer: true,
                        numberOfContestants: 6,
                        penalty: 50000, color: "#4d90fb:#771de4")
        self.goal.accept(goal)
        
        let members = [
            Member(id: 1,
                   name: "김자몽",
                   profileImageUrl: "https://i.imgur.com/k3241u3.jpg",
                   progressRate: 90,
                   kakaoId: "",
                   firebaseToken: ""),
            Member(id: 2,
                   name: "김승주",
                   profileImageUrl: "https://i.imgur.com/k3241u3.jpg",
                   progressRate: 50,
                   kakaoId: "",
                   firebaseToken: ""),
            Member(id: 3,
                   name: "오기환",
                   profileImageUrl: "https://i.imgur.com/k3241u3.jpg",
                   progressRate: 80,
                   kakaoId: "",
                   firebaseToken: ""),
            Member(id: 4,
                   name: "박수지",
                   profileImageUrl: "https://i.imgur.com/k3241u3.jpg",
                   progressRate: 60,
                   kakaoId: "",
                   firebaseToken: ""),
            Member(id: 5,
                   name: "이태송",
                   profileImageUrl: "https://i.imgur.com/k3241u3.jpg",
                   progressRate: 70,
                   kakaoId: "",
                   firebaseToken: "")
            
        ]
        
        let sortedMember = members.sorted { (lhs, rhs) -> Bool in
            let lhsProgress = lhs.progressRate ?? 0
            let rhsProgress = rhs.progressRate ?? 0
            
            return lhsProgress > rhsProgress
        }
        
        self.members.accept(sortedMember)
    }
    
    
}
