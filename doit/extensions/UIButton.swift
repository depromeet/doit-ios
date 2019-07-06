//
//  UIButton.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIButton {
    
    // Tap interaction where the button stays selected for 0.1 seconds
    public var interactiveTap: ControlEvent<Void> {
        let events = tap
            .do(onNext: { self.base.isSelected = true })
            .debounce(.milliseconds(100), scheduler: MainScheduler.instance)
            .do(onNext: { self.base.isSelected = false })
        return ControlEvent(events: events)
    }
}
