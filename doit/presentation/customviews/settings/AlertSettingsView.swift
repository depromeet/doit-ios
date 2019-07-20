//
//  AlertSettingsView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class AlertSettingsView: UIView {
 
    // MARK: - UI elements
    private lazy var header = SettingsHeaderView()
    private lazy var cell = SwitchableSettingsViewCell()
    
    public var toggleButton: UISwitch {
        return cell.toggleButton
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(header)
        addSubview(cell)
        
        header.text = "Alert"
        
        cell.title.text = "푸시 알림"
        
        header.snp.makeConstraints { make in
            make.height.equalTo(36)
            
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        cell.snp.makeConstraints { make in
            make.height.equalTo(48)
            
            make.top.equalTo(header.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
