//
//  MemberRepository.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift

class MemberRepository {
    
    static let shared = MemberRepository()
    
    func login(kakaoToken: String) -> Completable {
        return MemberService.shared.login(kakaoToken: kakaoToken)
                    .do(onNext: { member in
                        SettingsProvider.shared.memberId = member.id ?? 0
                        SettingsProvider.shared.memberName = member.name ?? ""
                        SettingsProvider.shared.memberProfileImageUrl = member.profileImageUrl ?? ""
                    })
                    .asCompletable()
    }
}
