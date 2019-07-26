//
//  AddGoalSuccessDialogViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift
import RxGesture

class AddGoalSuccessDialogViewController: UIViewController {
    
    var dismissHandler: (() -> Void)?
    private var disposeBag = DisposeBag()
    
    // MARK: - UI elements
    private lazy var contentView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var proceedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(proceedButton)
        
        contentView.backgroundColor = UIColor.black
        contentView.layer.roundCorners(radius: 4)
        
        titleLabel.font = .dialogTitle
        titleLabel.textColor = .white
        titleLabel.text = "Success!"
        
        descriptionLabel.font = .plainText
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = """
                                프로젝트 생성이 완료되었습니다.
                                이제 두잇에서 목표를 이뤄보세요!
                                """
        
        proceedButton.setTitle("프로젝트 홈가기", for: .normal)
        proceedButton.setTitleColor(.white, for: .normal)
        proceedButton.layer.roundCorners(radius: 25)
        proceedButton.titleLabel?.font = .dialogButton
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(contentView.snp.width).multipliedBy(0.771)
            
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(35)
            make.right.equalToSuperview().inset(35)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(38)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
        }
        
        proceedButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(50)
            
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        proceedButton.layoutIfNeeded()
        
        // Gradient backgroud
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.softBlue.cgColor, UIColor.purplyBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = proceedButton.bounds
        proceedButton.layer.insertSublayer(gradientLayer, at: 0)
        
        bindToSubViews()
    }
    
    private func bindToSubViews() {
        // Dismiss by tapping ONLY on the background
        view.rx.tapGesture(configuration: { gestureRecognizer, delegate in
                delegate.touchReceptionPolicy = .custom { (gestureRecognizer, touch) in
                    return touch.view == gestureRecognizer.view
                }
            })
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                self?.dismiss()
            }).disposed(by: disposeBag)
        
        
        proceedButton.rx.tap
            .bind { [weak self] in
                self?.dismiss()
            }
            .disposed(by: disposeBag)
    }
    
    private func dismiss() {
        dismissHandler?()
        dismiss(animated: true, completion: {})
    }
}
