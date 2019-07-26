//
//  DatePickerView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class DatePickerView: UIView {
    
    // MARK: - UI elements
    private lazy var titleLabel = UILabel()
    private lazy var startDate = UITextField()
    private lazy var endDate = UITextField()
    private lazy var backgroundView = UIView()
    private lazy var divider = UIView()
    
    public var start: UITextField {
        return startDate
    }
    
    public var end: UITextField {
        return endDate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(backgroundView)
        addSubview(divider)
        addSubview(startDate)
        addSubview(endDate)
        
        titleLabel.font = .settingsHeader
        titleLabel.textColor = .white
        titleLabel.text = "기간을 선택해주세요."
        
        backgroundView.backgroundColor = .blackThree
        backgroundView.layer.roundCorners(radius: 4)
        
        divider.backgroundColor = .veryLightPinkTwo
        
        startDate.font = .categoryTag
        startDate.textColor = .white
        startDate.attributedPlaceholder = NSAttributedString(string: "2019년 6월 1일", attributes: [
            .foregroundColor : UIColor.brownishGrey,
            .font: UIFont.categoryTag
            ])
        startDate.textAlignment = .center
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                    target: nil,
                                    action: nil)
        let doneButton = UIBarButtonItem(title: "확인",
                                         style: .done,
                                         target: self,
                                         action: #selector(datePickingDone))
        toolBar.barStyle = .blackTranslucent
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        let startDatePicker = UIDatePicker()
        startDatePicker.datePickerMode = .date
        startDate.inputView = startDatePicker
        startDate.inputAccessoryView = toolBar
        startDatePicker.addTarget(self,
                                  action: #selector(startDateChanged),
                                  for: .valueChanged)
        
        endDate.font = .categoryTag
        endDate.textColor = .white
        endDate.attributedPlaceholder = NSAttributedString(string: "2019년 7월 30일", attributes: [
            .foregroundColor : UIColor.brownishGrey,
            .font: UIFont.categoryTag
            ])
        endDate.textAlignment = .center
        
        let endDatePicker = UIDatePicker()
        endDatePicker.datePickerMode = .date
        endDate.inputView = endDatePicker
        endDate.inputAccessoryView = toolBar
        endDatePicker.addTarget(self,
                                  action: #selector(endDateChanged),
                                  for: .valueChanged)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(30)
        }
        
        startDate.snp.makeConstraints { make in
            make.left.equalTo(backgroundView)
            make.top.equalTo(backgroundView)
            make.bottom.equalTo(backgroundView)
            make.right.equalTo(divider.snp.left)
        }
        
        endDate.snp.makeConstraints { make in
            make.left.equalTo(divider.snp.right)
            make.top.equalTo(backgroundView)
            make.bottom.equalTo(backgroundView)
            make.right.equalTo(backgroundView)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.height.equalTo(40)
            
            make.top.equalTo(titleLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(20)
        }
        
        divider.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.width.equalTo(10)
            make.center.equalTo(backgroundView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startDateChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        startDate.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func endDateChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        endDate.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func datePickingDone() {
        endEditing(true)
    }
}
