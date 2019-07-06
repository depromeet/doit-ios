//
//  ProfileViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - UI elements
    private lazy var titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        
        titleLabel.font = .title1
        titleLabel.textColor = .white
        titleLabel.text = "My page"
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(46)
        }
    }
    
}
