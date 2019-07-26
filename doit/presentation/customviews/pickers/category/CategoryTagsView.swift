//
//  CategoryTagsView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class CategoryTagsView: UIView {
    
    private let offset: CGFloat = 10
    
    private var _categoryTabs: [UIButton] = []
    public var categoryTabs: [UIButton] {
        get {
            return _categoryTabs
        }
        set {
            _categoryTabs = newValue
            var x = CGFloat(0)
            var y = CGFloat(0)
            _categoryTabs.enumerated().forEach { (index, button) in
                button.frame = CGRect(x: x,
                                      y: y,
                                      width: button.frame.width,
                                      height: button.frame.height)
                x += button.frame.width + offset
                
                let nextTab = index <= _categoryTabs.count - 2 ?
                              _categoryTabs[index + 1] :
                              _categoryTabs[index]
                let nextTabWidth = nextTab.frame.width + offset
                
                if x + nextTabWidth > frame.width {
                    x = 0
                    y += button.frame.height + offset
                }
                
                addSubview(button)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
