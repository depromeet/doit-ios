//
//  TextSettingsViewCell.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class TextSettingsViewCell: UIView {
    
    // MARK: - UI elements
    private lazy var innerTitle = UILabel()
    private lazy var innerContent = UILabel()
    
    public var title: UILabel {
        return innerTitle
    }
    
    public var content: UILabel {
        return innerContent
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(innerTitle)
        addSubview(innerContent)
        
        innerTitle.font = .settingsCell
        innerTitle.textColor = .white
        
        innerContent.textColor = UIColor.white.withAlphaComponent(0.6)
        innerContent.font = .settingsCell
        
        innerTitle.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
        
        innerContent.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

