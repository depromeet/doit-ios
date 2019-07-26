//
//  MembersPickerView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class MembersPickerView: UIView {
    
    // MARK: - UI elements
    private lazy var titleLabel = UILabel()
    private lazy var membersTextField = UITextField()
    private lazy var backgroundView = UIView()
    
    public var title: UITextField {
        return membersTextField
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(backgroundView)
        addSubview(membersTextField)
        
        titleLabel.font = .settingsHeader
        titleLabel.textColor = .white
        titleLabel.text = "누구와 함께 할까요?"
        
        backgroundView.backgroundColor = .blackThree
        backgroundView.layer.roundCorners(radius: 4)
        
        membersTextField.font = .categoryTag
        membersTextField.textColor = .white
        membersTextField.attributedPlaceholder = NSAttributedString(string: "3명", attributes: [
            .foregroundColor : UIColor.brownishGrey,
            .font: UIFont.categoryTag
            ])
        membersTextField.textAlignment = .center
        membersTextField.keyboardType = .numberPad
        membersTextField.returnKeyType = .done
        membersTextField.delegate = self
        
        let numberToolbar = UIToolbar()
        numberToolbar.barStyle = .blackTranslucent
        numberToolbar.items=[
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "확인", style: .plain,
                            target: self,
                            action: #selector(numberPadDone))
        ]
        
        numberToolbar.sizeToFit()
        
        membersTextField.inputAccessoryView = numberToolbar
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(30)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.height.equalTo(40)
            
            make.top.equalTo(titleLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(20)
        }
        
        membersTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            
            make.top.equalTo(titleLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func numberPadDone() {
        membersTextField.resignFirstResponder()
    }
}

extension MembersPickerView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        membersTextField.resignFirstResponder()
        return true
    }
}
