//
//  NavigationBarButton.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class NavigationBarButton: UIButton {
    
    // MARK: - UI elements
    private lazy var icon = UIImageView()
    
    private var _option: NavgiationOption = .main
    
    public var option: NavgiationOption {
        get {
            return _option
        }
        set {
            _option = newValue
            icon.image = newValue.image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(icon)
        
        icon.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
