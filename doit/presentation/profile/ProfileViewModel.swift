//
//  ProfileViewModel.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift

class ProfileViewModel {
    
    
    public var profileImageUrl: PublishSubject<String> = PublishSubject()
    public var memberName: PublishSubject<String> = PublishSubject()
    
    func fetchMember() {
        profileImageUrl.onNext(SettingsProvider.shared.memberProfileImageUrl)
        memberName.onNext(SettingsProvider.shared.memberName)
    }
    
}
