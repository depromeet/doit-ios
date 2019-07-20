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
    private lazy var profileMetaView = ProfileMetaView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        view.addSubview(profileMetaView)
        
        titleLabel.font = .title1
        titleLabel.textColor = .white
        titleLabel.text = "My page"
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(46)
        }
        
        profileMetaView.snp.makeConstraints { make in
            make.height.equalTo(48)
            
            make.top.equalTo(titleLabel.snp.bottom).offset(33)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
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
    }
    
}
