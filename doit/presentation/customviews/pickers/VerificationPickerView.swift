//
//  VerificationPickerView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class VerificationPickerView: UIView {
    
    // MARK: - UI elements
    private lazy var titleLabel = UILabel()
    private lazy var timerEnabledButton = TimerEnabledButton()
    private lazy var iconImageView = UIImageView()
    private lazy var informationTitle = UILabel()
    private lazy var informationDescription = UILabel()
    
    public var button: UIButton {
        return timerEnabledButton.button
    }
    
    public var isEnabled: Bool {
        get {
            return timerEnabledButton.isEnabled
        }
        set {
            timerEnabledButton.isEnabled = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(timerEnabledButton)
        addSubview(iconImageView)
        addSubview(informationTitle)
        addSubview(informationDescription)
        
        titleLabel.font = .settingsHeader
        titleLabel.textColor = .white
        titleLabel.text = "인증방식을 고르세요. (중복가능)"
        
        iconImageView.image = UIImage(named: "informationIcon")
        
        informationTitle.font = .informationTitle
        informationTitle.textColor = .white
        informationTitle.text = "알려드려요"
        
        informationDescription.font = .informationDescription
        informationDescription.textColor = .white
        informationDescription.text = "기본 인증방식은 글+사진 입니다."
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(30)
        }
        
        timerEnabledButton.snp.makeConstraints { make in
            make.width.equalTo(132)
            make.height.equalTo(40)
            
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(48)
            make.bottom.equalToSuperview().inset(43)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(timerEnabledButton.snp.right).offset(14)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
        }
        
        informationTitle.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(3)
            make.centerY.equalTo(iconImageView)
        }
        
        informationDescription.snp.makeConstraints { make in
            make.left.equalTo(iconImageView)
            make.top.equalTo(iconImageView.snp.bottom).offset(2)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
