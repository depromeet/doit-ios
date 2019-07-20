//
//  PlainSettingsViewCell.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class PlainSettingsViewCell: UIView {
    
    // MARK: - UI elements
    private lazy var innerTitle = UILabel()
    private lazy var innerButton = UIButton()
    
    public var button: UIButton {
        return innerButton
    }
    
    public var title: UILabel {
        return innerTitle
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(innerTitle)
        addSubview(innerButton)
        
        innerTitle.font = .settingsCell
        innerTitle.textColor = .white
        
        innerTitle.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
        
        innerButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
