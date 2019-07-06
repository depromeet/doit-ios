//
//  NavigationBarButton.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class NavigationBarHighlightButton: UIButton {
    
    private lazy var icon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(icon)
        
        icon.image = UIImage(named: "icAddN")
        
        icon.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        // Gradient backgroud
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.dodgerBlue.cgColor, UIColor.purple.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
        layer.roundCorners(radius: bounds.width / 2)
    }
}
