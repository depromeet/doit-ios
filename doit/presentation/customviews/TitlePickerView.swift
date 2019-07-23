//
//  TitlePickerView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

class TitlePickerView: UIView {
    
    // MARK: - UI elements
    private lazy var titleLabel = UILabel()
    private lazy var titleTextField = UITextField()
    private lazy var backgroundView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(backgroundView)
        addSubview(titleTextField)
        
        titleLabel.font = .settingsHeader
        titleLabel.textColor = .white
        titleLabel.text = "프로젝트의 상세 타이틀을 적어주세요."
        
        backgroundView.backgroundColor = .blackThree
        backgroundView.layer.roundCorners(radius: 4)
        
        titleTextField.font = .categoryTag
        titleTextField.textColor = .white
        titleTextField.attributedPlaceholder = NSAttributedString(string: "주 3회 이상 운동하기", attributes: [
            .foregroundColor : UIColor.brownishGrey,
            .font: UIFont.categoryTag
        ])
        titleTextField.textAlignment = .center
        titleTextField.returnKeyType = .done
        titleTextField.delegate = self
        
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
        
        titleTextField.snp.makeConstraints { make in
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
}

extension TitlePickerView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
}
