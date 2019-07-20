//
//  AppSettingsView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class AppSettingsView: UIView {
    
    // MARK: - UI elements
    private lazy var header = SettingsHeaderView()
    private lazy var textCell = TextSettingsViewCell()
    private lazy var plainCell = PlainSettingsViewCell()
    
    public var button: UIButton {
        return plainCell.button
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(header)
        addSubview(textCell)
        addSubview(plainCell)
        
        header.text = "App"
        
        textCell.title.text = "버전 정보"
        textCell.content.text = "1.0"
        
        plainCell.title.text = "오픈 소스 라이브러리"
        
        header.snp.makeConstraints { make in
            make.height.equalTo(36)
            
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        textCell.snp.makeConstraints { make in
            make.height.equalTo(48)
            
            make.top.equalTo(header.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        plainCell.snp.makeConstraints { make in
            make.height.equalTo(48)
            
            make.top.equalTo(textCell.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
