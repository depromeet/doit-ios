//
//  GoalViewCell.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift

enum GoalViewType {
    case normal
    case addGoal
}

class GoalViewCell: UICollectionViewCell {
    
    public var disposeBag = DisposeBag()
    public static let identifier = "GOAL_VIEW_CELL"
    
    private lazy var addImageView = UIImageView()
    private lazy var addTitle = UILabel()
    private lazy var addDescription = UILabel()
    
    private lazy var titleLabel = UILabel()
    private lazy var subtitleLabel = UILabel()
    private lazy var moreButton = UIButton()
    private lazy var categoryLabel = UILabel()
    private lazy var categoryBackgroundView = UIView()
    private lazy var progressLabel = UILabel()
    private lazy var progressPercentageLabel = UILabel()
    private lazy var circularProgressBar = CircularProgressBar()
    
    private var _type: GoalViewType = .normal
    public var type: GoalViewType {
        get {
            return _type
        }
        set {
            _type = newValue
            switch _type {
            case .normal:
                contentView.addSubview(titleLabel)
                contentView.addSubview(subtitleLabel)
                contentView.addSubview(moreButton)
                contentView.addSubview(categoryLabel)
                contentView.addSubview(categoryBackgroundView)
                contentView.addSubview(progressLabel)
                contentView.addSubview(progressPercentageLabel)
                contentView.addSubview(circularProgressBar)
                
                titleLabel.font = .goalCardTitle
                titleLabel.textColor = .offWhite
                
                subtitleLabel.font = .goalCardDescription
                subtitleLabel.textColor = .offWhite
                
                moreButton.setImage(UIImage(named: "btnMoreN"), for: .normal)
                
                categoryLabel.font = .goalCardCategory
                categoryLabel.textColor = .offWhite
                
                categoryBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.15)
                categoryBackgroundView.layer.roundCorners(radius: 12)
                
                progressLabel.font = .goalCardProgressLabel
                progressLabel.textColor = .offWhite
                progressLabel.text = "현재 진행률"
                
                progressPercentageLabel.font = .goalCardProgressPercentage
                progressPercentageLabel.textColor = .offWhite
                
                titleLabel.snp.makeConstraints { make in
                    make.left.equalToSuperview().inset(20)
                    make.top.equalToSuperview().inset(20)
                    make.right.equalToSuperview().inset(50)
                }
                
                subtitleLabel.snp.makeConstraints { make in
                    make.left.equalToSuperview().inset(20)
                    make.top.equalTo(titleLabel.snp.bottom).offset(4)
                }
                
                moreButton.snp.makeConstraints { make in
                    make.right.equalToSuperview().inset(10)
                    make.top.equalToSuperview().inset(23)
                }
                
                categoryLabel.snp.makeConstraints { make in
                    make.center.equalTo(categoryBackgroundView)
                }
                
                categoryBackgroundView.snp.makeConstraints { make in
                    make.width.equalTo(48)
                    make.height.equalTo(24)
                    
                    make.left.equalToSuperview().inset(20)
                    make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
                }
                
                progressLabel.snp.makeConstraints { make in
                    make.center.equalToSuperview()
                }
                
                progressPercentageLabel.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalTo(progressLabel.snp.bottom).offset(4)
                }
                
                circularProgressBar.snp.makeConstraints { make in
                    make.width.equalTo(189)
                    make.height.equalTo(189)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(23)
                }
                
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
    
    private var _goal: Goal?
    public var goal: Goal? {
        get {
            return _goal
        }
        set {
            _goal = newValue
            
            // Gradient backgroud
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [_goal?.startingColor?.cgColor, _goal?.endingColor?.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.locations = [0, 1]
            gradientLayer.frame = bounds
            
            layer.insertSublayer(gradientLayer, at: 0)
            layer.roundCorners(radius: 4)
            
            titleLabel.text = _goal?.title
            subtitleLabel.text = _goal?.subtitle
            categoryLabel.text = _goal?.category
            progressPercentageLabel.text = _goal?.percentageText
            circularProgressBar.layoutIfNeeded()
            circularProgressBar.percentage = CGFloat(_goal?.percentage ?? 0)
        }
    }
    
    public var button: UIButton {
        return moreButton
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
