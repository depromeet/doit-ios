//
//  ProceedButton.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class ProceedButton: UIView {
    
    // MARK: - UI elements
    private lazy var innerButton = UIButton()
    private lazy var label = UILabel()
    
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
                label.textColor = .black
            }
        }
    }
    
    public var button: UIButton {
        return innerButton
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(innerButton)
        
        layer.roundCorners(radius: 4)
        backgroundColor = UIColor.white.withAlphaComponent(0.2)
        
        label.textColor = .black
        label.text = "다음"
        label.font = .proceedButton
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        innerButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
