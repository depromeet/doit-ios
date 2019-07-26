//
//  MemberProgessBar.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class MemberProgressBar: UIView {
    private let foregroundLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    
    private var _percentage: CGFloat = 0.0
    public var percentage: CGFloat {
        get {
            return _percentage
        }
        set {
            _percentage = newValue
            
            let progress = _percentage / 100.0
            
            // Set strokeEnd
            foregroundLayer.strokeEnd = CGFloat(progress)
            
            // Animate
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.fromValue = 0
            animation.toValue = progress
            animation.duration = 1
            foregroundLayer.add(animation, forKey: "foregroundAnimation")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundPath = UIBezierPath()
        backgroundPath.move(to: CGPoint(x: 0, y: 5))
        backgroundPath.addLine(to: CGPoint(x: 167, y: 5))
        backgroundLayer.lineCap = .round
        backgroundLayer.path = backgroundPath.cgPath
        backgroundLayer.strokeColor = UIColor.white.withAlphaComponent(0.15).cgColor
        backgroundLayer.lineWidth = 9
        backgroundLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(backgroundLayer)
        
        
        let foregroundPath = UIBezierPath()
        foregroundPath.move(to: CGPoint(x: 0, y: 5))
        foregroundPath.addLine(to: CGPoint(x: 167, y: 5))
        foregroundLayer.lineCap = .round
        foregroundLayer.path = foregroundPath.cgPath
        foregroundLayer.lineWidth = 9
        foregroundLayer.fillColor = UIColor.clear.cgColor
        foregroundLayer.strokeColor = UIColor.white.withAlphaComponent(0.95).cgColor
        foregroundLayer.strokeEnd = 0
        
        layer.addSublayer(foregroundLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
