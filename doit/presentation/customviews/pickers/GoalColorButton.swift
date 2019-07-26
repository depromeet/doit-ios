//
//  GoalColorButton.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class GoalColorButton: UIButton {
    
    private lazy var gradientLayer = CAGradientLayer()
    
    private var _isOn = false
    public var isOn: Bool {
        get {
            return _isOn
        }
        set {
            _isOn = newValue
            if _isOn {
                // TODO
                layer.addBorder(width: 2, color: UIColor.white.cgColor)
//                setTitleColor(UIColor.white, for: .normal)
            } else {
                // TODO
                layer.addBorder(width: 0, color: UIColor.clear.cgColor)
            }
        }
    }
    
    private var _goalColor: GoalColor?
    public var goalColor: GoalColor? {
        get {
            return _goalColor
        }
        set {
            _goalColor = newValue
            
            // Gradient backgroud
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [_goalColor?.startingColor.cgColor, _goalColor?.endingColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.locations = [0, 1]
            gradientLayer.frame = bounds
            
            layer.insertSublayer(gradientLayer, at: 0)
            layer.roundCorners(radius: 4)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        layer.roundCorners(radius: 4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
