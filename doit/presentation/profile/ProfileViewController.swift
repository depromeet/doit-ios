//
//  ProfileViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift

class ProfileViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    // MARK: - UI elements
    private lazy var titleLabel = UILabel()
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var profileMetaView = ProfileMetaView()
    private lazy var alertSettings = AlertSettingsView()
    private lazy var goalSettings = GoalSettingsView()
    private lazy var feedbackSettings = FeedbackSettingsView()
    private lazy var appSettings = AppSettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(profileMetaView)
        contentView.addSubview(alertSettings)
        contentView.addSubview(goalSettings)
        contentView.addSubview(feedbackSettings)
        contentView.addSubview(appSettings)
        
        titleLabel.font = .title1
        titleLabel.textColor = .white
        titleLabel.text = "My page"
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(46)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(scrollView.snp.height)
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        profileMetaView.snp.makeConstraints { make in
            make.height.equalTo(48)
            
            make.top.equalToSuperview().inset(13)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        alertSettings.snp.makeConstraints { make in
            make.height.equalTo(84)
            
            make.top.equalTo(profileMetaView.snp.bottom).offset(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        goalSettings.snp.makeConstraints { make in
            make.height.equalTo(84)
            
            make.top.equalTo(alertSettings.snp.bottom).offset(24)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        feedbackSettings.snp.makeConstraints { make in
            make.height.equalTo(84)
            
            make.top.equalTo(goalSettings.snp.bottom).offset(24)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        appSettings.snp.makeConstraints { make in
            make.height.equalTo(132)
            
            make.top.equalTo(feedbackSettings.snp.bottom).offset(24)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        bindToViewModel()
        bindToSubViews()
    }
    
    private func bindToViewModel() {
        
    }
    
    private func bindToSubViews() {
        profileMetaView.button.rx.tap
            .bind { [weak self] in
                // TODO - Log out here...
            }
            .disposed(by: disposeBag)
        
        alertSettings.toggleButton.rx.isOn
            .changed
            .bind { isOn in
                // TODO - Alert settings here...
            }
            .disposed(by: disposeBag)
        
        goalSettings.button.rx.tap
            .bind {
                // TODO - Show past goals here
            }
            .disposed(by: disposeBag)
        
        feedbackSettings.button.rx.tap
            .bind {
                // TODO - Show feedback here
            }
            .disposed(by: disposeBag)
        
        appSettings.button.rx.tap
            .bind {
                // TODO - Show feedback here
            }
            .disposed(by: disposeBag)
        
        
    }
    
}
