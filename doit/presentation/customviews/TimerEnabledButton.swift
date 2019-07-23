//
//  TimerEnabledButton.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class TimerEnabledButton: UIView {
    // MARK: - UI elements
    private lazy var logoImageView = UIImageView()
    private lazy var label = UILabel()
    private lazy var innerButton = UIButton()
    
    private var _isEnabled: Bool = false
    public var isEnabled: Bool {
        get {
            return _isEnabled
        }
        set {
            _isEnabled = newValue
            
            if _isEnabled {
                // Gradient backgroud
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [UIColor.burple.cgColor, UIColor.dodgerBlue.cgColor]
                gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
                gradientLayer.locations = [0, 1]
                gradientLayer.frame = bounds
                layer.addSublayer(gradientLayer)
                layer.roundCorners(radius: 4)
                
                label.textColor = .white
            } else {
                label.textColor = UIColor.white.withAlphaComponent(0.5)
            }
        }
    }
    
    public var button: UIButton {
        return innerButton
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(logoImageView)
        addSubview(label)
        addSubview(innerButton)
        
        label.font = .categoryTag
        label.text = "타이머 사용"
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        backgroundColor = .blackThree
        layer.roundCorners(radius: 4)
        
        logoImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(21.2)
            make.centerY.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(23)
            make.centerY.equalToSuperview()
        }
        
        innerButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
