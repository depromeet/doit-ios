//
//  GoalChooserViewCell.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class GoalChooserViewCell: UITableViewCell {
    
    public static let identifier = "GOAL_CHOOSER_VIEW_CELL"
    
    // MARK: - UI elements
    private lazy var label = UILabel()
    
    public var goal: Goal? {
        get {
            return nil
        }
        set {
            label.text = newValue?.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionColor = UIColor(hexString: "#333333")
        
        contentView.backgroundColor = .black
        contentView.addSubview(label)
        
        label.font = .goalChooserViewCell
        label.textColor = .white
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
