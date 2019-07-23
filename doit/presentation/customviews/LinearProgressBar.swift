//
//  LinearProgressBar.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class LinearProgressBar: UIView {
    
    private lazy var bar = UIView()
    private var _progress: CGFloat = 0.0
    
    // Progress between 0 and 1
    public var progress: CGFloat {
        get {
            return _progress
        }
        set {
            _progress = newValue
            
            // Animate
            let animation = CABasicAnimation(keyPath: "bounds.size.width")
            animation.fromValue = 0
            animation.toValue = frame.size.width * newValue
            animation.duration = 1
            bar.layer.add(animation, forKey: "widthAnimation")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bar)
        
        bar.snp.makeConstraints { make in
            make.height.equalTo(3)
            make.width.equalTo(187)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        bar.layoutIfNeeded()
        
        // Gradient backgroud
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.burple.cgColor, UIColor.dodgerBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.locations = [0, 0.5]
        gradientLayer.frame = bar.bounds
        
        bar.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
