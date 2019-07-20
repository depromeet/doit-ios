//
//  GoalSettingsView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class GoalSettingsView: UIView {
    
    // MARK: - UI elements
    private lazy var header = SettingsHeaderView()
    private lazy var cell = PlainSettingsViewCell()
    
    public var button: UIButton {
        return cell.button
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(header)
        addSubview(cell)
        
        header.text = "Goal"
        
        cell.title.text = "종료된 Goal 보기"
        
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
