//
//  GoalViewCell.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

enum GoalViewType {
    case normal
    case addGoal
}

class GoalViewCell: UICollectionViewCell {
    
    public static let identifier = "GOAL_VIEW_CELL"
    
    private lazy var addImageView = UIImageView()
    private lazy var addTitle = UILabel()
    private lazy var addDescription = UILabel()
    
    private var _type: GoalViewType = .normal
    public var type: GoalViewType {
        get {
            return _type
        }
        set {
            _type = newValue
            switch _type {
            case .normal:
                break
            case .addGoal:
                contentView.backgroundColor = .darkGrey
                contentView.addSubview(addImageView)
                contentView.addSubview(addTitle)
                contentView.addSubview(addDescription)
                
                addImageView.image = UIImage(named: "icAddcardN")
                
                addTitle.font = .goalCardTitle
                addTitle.textColor = .white
                addTitle.text = "Make Goal"
                
                addDescription.font = .goalCardDescription
                addDescription.textColor = .white
                addDescription.text = "새로운 목표를 만들어 볼까요?"
                
                addImageView.snp.makeConstraints { make in
                    make.top.equalToSuperview().inset(128)
                    make.centerX.equalToSuperview()
                }
                
                addTitle.snp.makeConstraints { make in
                    make.top.equalTo(addImageView.snp.bottom).offset(15)
                    make.centerX.equalToSuperview()
                }
                
                addDescription.snp.makeConstraints { make in
                    make.top.equalTo(addTitle.snp.bottom).offset(9)
                    make.centerX.equalToSuperview()
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.roundCorners(radius: 4)
        layer.addShadow(radius: 4.5, opacity: 0.12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
