//
//  PenaltyPickerView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

enum Penalty: CaseIterable {
    case fiveThousand
    case tenThousand
    case etc
    
    var labelText: String {
        switch self {
        case .fiveThousand: return "5,000원"
        case .tenThousand:  return "10,000원"
        case .etc:          return "기타"
        }
    }
}

class PenaltyPickerView: UIView {
    
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
        titleLabel.text = "벌금을 선택해 주세요. (인당)"
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(30)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.height.equalTo(40)
            
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
