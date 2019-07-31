//
//  OnBoardingViewCell.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class OnBoardingViewCell: UICollectionViewCell {
    
    public static let identifier = "ONBORADING_VIEW_CELL"
    
    // MARK: - UI elements
    private lazy var pageNumberLabel = UILabel()
    private lazy var divider = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var imageView = UIImageView()
    
    public var page: OnBoardingPage? {
        get { return nil }
        set {
            guard let page = newValue else { return }
            pageNumberLabel.text = String(format: "%02d", page.rawValue)
            titleLabel.text = page.title
            descriptionLabel.text = page.description
            imageView.image = page.image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        
        addSubview(pageNumberLabel)
        addSubview(divider)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(imageView)
        
        pageNumberLabel.font = FontProvider.font(size: 20, weight: .bold)
        pageNumberLabel.textColor = .white
        
        divider.backgroundColor = .white
        
        titleLabel.font = FontProvider.font(size: 18, weight: .bold)
        titleLabel.textColor = .white
        
        descriptionLabel.font = FontProvider.font(size: 14, weight: .light)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        pageNumberLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(63)
        }
        
        divider.snp.makeConstraints { make in
            make.width.equalTo(16)
            make.height.equalTo(3)
            make.top.equalTo(pageNumberLabel.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(divider.snp.bottom).offset(17)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().inset(38)
            make.right.equalToSuperview().inset(38)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
