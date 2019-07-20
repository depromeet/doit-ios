//
//  SettingsHeaderView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class SettingsHeaderView: UIView {
    
    // MARK: - UI elements
    private lazy var label = UILabel()
    
    public var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        
        label.font = .settingsHeader
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
