//
//  GoalDetailMetaView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class GoalDetailMetaView: UIView {
    
    // MARK: - UI elements
    private lazy var daysLeftLabel = UILabel()
    private lazy var daysLeftDescription = UILabel()
    private lazy var divider = UIView()
    private lazy var penaltySumLabel = UILabel()
    private lazy var penaltySumDescription = UILabel()
    
    public var daysLeftText: String? {
        get {
            return daysLeftLabel.text
        }
        set {
            daysLeftLabel.text = newValue
        }
    }
    
    public var penaltyText: String? {
        get {
            return penaltySumLabel.text
        }
        set {
            penaltySumLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white.withAlphaComponent(0.15)
        layer.roundCorners(radius: 4)
        
        addSubview(daysLeftLabel)
        addSubview(daysLeftDescription)
        addSubview(divider)
        addSubview(penaltySumLabel)
        addSubview(penaltySumDescription)
        
        daysLeftLabel.font = .goalDetailMetaLabel
        daysLeftLabel.textColor = .white
        daysLeftLabel.textAlignment = .center
        
        daysLeftDescription.font = .goalDetailMetaDescription
        daysLeftDescription.textColor = .white
        daysLeftDescription.addCharactersSpacing(spacing: 1.5, text: "남은 기간")
        daysLeftDescription.textAlignment = .center
        
        divider.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        
        penaltySumLabel.font = .goalDetailMetaLabel
        penaltySumLabel.textColor = .white
        penaltySumLabel.textAlignment = .center
        
        penaltySumDescription.font = .goalDetailMetaDescription
        penaltySumDescription.textColor = .white
        penaltySumDescription.addCharactersSpacing(spacing: 1.5, text: "전체 금액")
        penaltySumDescription.textAlignment = .center

        
        daysLeftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalTo(divider.snp.left)
            make.top.equalToSuperview().inset(22)
        }
        
        daysLeftDescription.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalTo(divider.snp.left)
            make.top.equalTo(daysLeftLabel.snp.bottom).offset(6)
        }
        
        divider.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(66)
            
            make.center.equalToSuperview()
        }
        
        penaltySumLabel.snp.makeConstraints { make in
            make.left.equalTo(divider.snp.right)
            make.right.equalToSuperview()
            make.top.equalToSuperview().inset(22)
        }
        
        penaltySumDescription.snp.makeConstraints { make in
            make.left.equalTo(divider.snp.right)
            make.right.equalToSuperview()
            make.top.equalTo(daysLeftLabel.snp.bottom).offset(6)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
