//
//  ProfileMetaView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class ProfileMetaView: UIView {
    
    // MARK: - UI elements
    private lazy var profileImageView = UIImageView()
    private lazy var profileNameLabel = UILabel()
    private lazy var logoutButton = UIButton()
    
    public var button: UIButton {
        return logoutButton
    }
    
    public var imageView: UIImageView {
        return profileImageView
    }
    
    public var name: UILabel {
        return profileNameLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        addSubview(profileImageView)
        addSubview(profileNameLabel)
        addSubview(logoutButton)
        
        profileImageView.layer.roundCorners(radius: 24)
        profileImageView.setImage(urlString: "https://i.imgur.com/k3241u3.jpg")
        
        profileNameLabel.font = .profileName
        profileNameLabel.textColor = .white
        profileNameLabel.text = "taesong.lee 님"
        
        logoutButton.layer.roundCorners(radius: 15)
        logoutButton.setTitle("로그아웃", for: .normal)
        logoutButton.backgroundColor = .blackThree
        logoutButton.setTitleColor(.brownishGrey, for: .normal)
        logoutButton.titleLabel?.font = .logoutButton
        
        profileImageView.snp.makeConstraints { make in
            make.width.equalTo(48)
            make.height.equalTo(48)
            
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(26)
        }
        
        profileNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(profileImageView.snp.right).offset(15.5)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(90)
            
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(26)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
