//
//  CircularProgressBar.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class CircularProgressBar: UIView {
    
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
            animation.fromValue = 0
            animation.toValue = progress
            animation.duration = 1
            foregroundLayer.add(animation, forKey: "foregroundAnimation")
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let center = CGPoint(x: 94.5, y: 94.5)
        
        let backgroundPath = UIBezierPath(arcCenter: center,
                                          radius: 94.5,
                                          startAngle: 0,
                                          endAngle: 2 * .pi,
                                          clockwise: true)
        self.backgroundLayer.path = backgroundPath.cgPath
        self.backgroundLayer.strokeColor = UIColor.white.withAlphaComponent(0.15).cgColor
        self.backgroundLayer.lineWidth = 9
        self.backgroundLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(backgroundLayer)
        
        let startAngle = (-CGFloat.pi/2)
        let endAngle = 2 * CGFloat.pi + startAngle
        
        let foregroundPath = UIBezierPath(arcCenter: center,
                                          radius: 94.5,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
        
        foregroundLayer.lineCap = .round
        foregroundLayer.path = foregroundPath.cgPath
        foregroundLayer.lineWidth = 9
        foregroundLayer.fillColor = UIColor.clear.cgColor
        foregroundLayer.strokeColor = UIColor.white.withAlphaComponent(0.95).cgColor
        foregroundLayer.strokeEnd = 0
        
        self.layer.addSublayer(foregroundLayer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
