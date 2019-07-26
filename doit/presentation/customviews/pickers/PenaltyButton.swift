//
//  PenaltyButton.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class PenaltyButton: UIButton {
    
    private lazy var gradientLayer = CAGradientLayer()
    
    private var _isOn = false
    public var isOn: Bool {
        get {
            return _isOn
        }
        set {
            _isOn = newValue
            if _isOn {
                // Gradient backgroud
                gradientLayer.colors = [UIColor.burple.cgColor, UIColor.dodgerBlue.cgColor]
                gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
                gradientLayer.locations = [0, 1]
                gradientLayer.frame = bounds
                
                layer.insertSublayer(gradientLayer, at: 0)
                setTitleColor(UIColor.white, for: .normal)
            } else {
                gradientLayer.removeFromSuperlayer()
                setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            }
        }
    }
    
    private var _penalty: Penalty?
    public var penalty: Penalty? {
        get {
            return _penalty
        }
        set {
            _penalty = newValue
            setTitle(_penalty?.labelText, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(.brownishGrey, for: .normal)
        titleLabel?.font = .pickerButton
        backgroundColor = .blackThree
        layer.roundCorners(radius: 4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
