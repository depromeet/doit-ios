//
//  NavigationBarView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift

class NavgiationBarView: UIView {

    private var disposeBag = DisposeBag()
    
    // MARK: - Emitted elements
    public var selectedIndex: PublishSubject<Int> = PublishSubject()
    public var isHighlightButtonSelected: PublishSubject<Void> = PublishSubject()
    
    // MARK: - UI elements
    private lazy var divider = UIView()
    private lazy var stackView = UIStackView()
    private lazy var button = NavigationBarHighlightButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(divider)
        addSubview(stackView)
        addSubview(button)
        
        backgroundColor = .black
        
        divider.backgroundColor = .blackTwo
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        NavgiationOption.allCases.forEach { option in
            let button = NavigationBarButton()
            button.option = option
            button.rx.interactiveTap
                .bind { [weak self] in
                    self?.selectedIndex.onNext(option.index)
                }
                .disposed(by: disposeBag)
            stackView.addArrangedSubview(button)
        }
        
        button.rx.interactiveTap
            .bind { [weak self] in
                self?.isHighlightButtonSelected.onNext(())
            }
            .disposed(by: disposeBag)
        
        divider.snp.makeConstraints { make in
            make.height.equalTo(1)
            
            make.centerY.equalTo(button)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.dodgerBlue.cgColor, UIColor.purple.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        // TODO: Fix gradient
        gradientLayer.locations = [0, 0.8, 0.85, 0.9, 1]
        gradientLayer.frame = button.bounds
        
        button.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
