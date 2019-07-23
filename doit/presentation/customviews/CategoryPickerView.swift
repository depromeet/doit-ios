//
//  CategoryPickerView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxCocoa

class CategoryPickerView: UIView {
    
    // MARK: - UI elements
    private lazy var titleLabel = UILabel()
    lazy var categoryTagsView = CategoryTagsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(categoryTagsView)
        
        titleLabel.font = .settingsHeader
        titleLabel.textColor = .white
        titleLabel.text = "카테고리를 고르세요."
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(30)
        }
        
        categoryTagsView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
