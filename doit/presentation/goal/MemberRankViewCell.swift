//
//  MemberRankViewCell.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class MemberRankViewCell: UITableViewCell {
    
    public static let identifier = "MEMBER_RANK_VIEW_CELL"
    
    // MARK: - UI elements
    private lazy var rankLabel = UILabel()
    private lazy var rankBadgeImageView = UIImageView()
    private lazy var profileImageView = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var progressBar = MemberProgressBar()
    private lazy var percentageLabel = UILabel()
    
    public var member: Member? {
        get {
            return nil
        }
        set {
            guard let member = newValue else {
                return
            }
            nameLabel.text = member.name
            percentageLabel.text = member.percentageText
            if let percentage = member.progressRate {
                progressBar.percentage = CGFloat(percentage)
            }
            if let profileImageUrl = member.profileImageUrl {
                profileImageView.setImage(urlString: profileImageUrl)
            }
        }
    }
    
    public var row: Int {
        get {
            return 0
        }
        set {
            let rank = newValue + 1
            rankLabel.text = String(rank)
            switch rank {
            case 1:
                rankBadgeImageView.image = UIImage(named: "goldMedalIcon")
            case 2:
                rankBadgeImageView.image = UIImage(named: "silverMedalIcon")
            case 3:
                rankBadgeImageView.image = UIImage(named: "bronzeMedalIcon")
            default:
                rankBadgeImageView.image = nil
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubview(rankBadgeImageView)
        contentView.addSubview(rankLabel)
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(progressBar)
        contentView.addSubview(percentageLabel)
        
        rankLabel.font = .rankLabel
        rankLabel.textColor = .white
        
        profileImageView.layer.roundCorners(radius: 22)
        
        nameLabel.font = .plainText
        nameLabel.textColor = .white
        
        percentageLabel.font = .rankPercentage
        percentageLabel.textColor = .white
        
        rankLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(35)
            make.centerY.equalToSuperview()
        }
        
        rankBadgeImageView.snp.makeConstraints { make in
            make.centerX.equalTo(rankLabel)
            make.centerY.equalToSuperview().offset(4)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.width.equalTo(44)
            make.height.equalTo(44)
            
            make.left.equalToSuperview().inset(60)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView).offset(3)
            make.left.equalTo(profileImageView.snp.right).offset(10)
        }
        
        progressBar.snp.makeConstraints { make in
            make.width.equalTo(167)
            make.height.equalTo(10)
            
            make.left.equalTo(profileImageView.snp.right).offset(10)
            make.bottom.equalTo(profileImageView).offset(-6)
        }
        
        percentageLabel.snp.makeConstraints { make in
            make.left.equalTo(progressBar.snp.right).offset(10)
            make.centerY.equalTo(progressBar)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
