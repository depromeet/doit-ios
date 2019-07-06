//
//  NavigationOption.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

enum NavgiationOption {
    case main
    case profile
    
    var image: UIImage? {
        switch self {
        case .main:
            return UIImage(named: "btnNaviHomeN")
        case .profile:
            return UIImage(named: "btnNaviMypageN")
        }
    }
    
    var index: Int {
        switch self {
        case .main:
            return 0
        case .profile:
            return 1
        }
    }
}

extension NavgiationOption: CaseIterable {
    
}
