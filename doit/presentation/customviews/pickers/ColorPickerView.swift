//
//  ColorPickerView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class ColorPickerView: UIView {
    
    // MARK: - UI elements
    private lazy var titleLabel = UILabel()
    private lazy var buttonStackView = UIStackView()
    
    public var stackView: UIStackView {
        return buttonStackView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(buttonStackView)
        
        titleLabel.font = .settingsHeader
        titleLabel.textColor = .white
        titleLabel.text = "프로젝트의 컬러를 선택하세요."
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(30)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.height.equalTo(30)
            
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(28)
            make.right.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().inset(17)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
