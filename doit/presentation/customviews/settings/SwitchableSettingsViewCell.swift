//
//  SwitchableSettingsViewCell.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class SwitchableSettingsViewCell:  UIView {
    
    // MARK: - UI elements
    private lazy var innerTitle = UILabel()
    private lazy var innerSwitch = UISwitch()
    
    public var title: UILabel {
        return innerTitle
    }
    
    public var toggleButton: UISwitch {
        return innerSwitch
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(innerTitle)
        addSubview(innerSwitch)
        
        innerTitle.font = .settingsCell
        innerTitle.textColor = .white
        
        innerSwitch.onTintColor = .dodgerBlue
        
        innerTitle.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
        
        innerSwitch.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(26)
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

