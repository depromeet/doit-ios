//
//  CategoryTagButton.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class CategoryTagButton: UIButton {
    
    private lazy var gradientLayer = CAGradientLayer()
    
    private var _isOn = false
    public var isOn: Bool {
        get {
            return _isOn
        }
        set {
            _isOn = newValue
            if _isOn {
                layer.insertSublayer(gradientLayer, at: 0)
                setTitleColor(UIColor.white, for: .normal)
            } else {
                gradientLayer.removeFromSuperlayer()
                setTitleColor(UIColor.white.withAlphaComponent(0.4), for: .normal)
            }
        }
    }
    
    private var _category: Category?
    public var category: Category? {
        get {
            return _category
        }
        set {
            _category = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(category: Category) {
        self.init()
        self.category = category
        
        let leftMargin = CGFloat(17)
        let rightMargin = CGFloat(17)
        let topMargin = CGFloat(8)
        let bottomMargin = CGFloat(8)
        
        let font = UIFont.categoryTag
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let size = category.labelText.size(withAttributes: attributes)
        
        backgroundColor = .blackThree
        titleLabel?.font = font
        setTitle(category.labelText, for: .normal)
        setTitleColor(UIColor.white.withAlphaComponent(0.4), for: .normal)
        layer.roundCorners(radius: 16)
        frame = CGRect(x: 0.0,
                       y: 0.0,
                       width: size.width + leftMargin + rightMargin,
                       height: size.height + topMargin + bottomMargin)
        titleEdgeInsets = UIEdgeInsets(top: topMargin,
                                       left: leftMargin,
                                       bottom: bottomMargin,
                                       right: rightMargin)
        
        // Gradient backgroud
        gradientLayer.colors = [UIColor.burple.cgColor, UIColor.dodgerBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
    }
}
