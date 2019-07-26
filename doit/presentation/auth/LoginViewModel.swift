//
//  LoginViewModel.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import RxSwift

class LoginViewModel {
    
    private var disposeBag = DisposeBag()
    public var authenticationSuccess: PublishSubject<Void> = PublishSubject()
    
    func requestLogin(kakaoToken: String) {
        
        MemberRepository.shared.login(kakaoToken: kakaoToken)
            .observeOn(MainScheduler.instance)
            .subscribe(onCompleted: { [weak self] in
                self?.authenticationSuccess.onNext(())
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}
