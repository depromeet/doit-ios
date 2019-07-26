//
//  UILabel.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

extension UILabel {
    func addCharactersSpacing(spacing: CGFloat, text: String) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.kern,
                                      value: spacing,
                                      range: NSMakeRange(0, text.count))
        self.attributedText = attributedString
    }
}
