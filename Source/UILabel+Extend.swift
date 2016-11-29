//
//  UILabel+Extend.swift
//  dinner517
//
//  Created by sheldon on 15/11/20.
//  Copyright (c) 2015年 anglesoft. All rights reserved.
//

import UIKit

extension UILabel {
    
    
    /// Applies strikethrough attribute for the text displayed by the label.
    func strikethrough() {
        self.attributedText = NSMutableAttributedString.strikethrough(withText: self.text)
    }
    
    
    /// Applies strikethrough attribute for the text displayed by the label with a given color.
    func strikethrough(color: UIColor) {
        self.attributedText = NSMutableAttributedString.strikethrough(withText: self.text, color: color)
    }
    
    
    /// Applies underline attribute for the text displayed by the label.
    func underline() {
        self.attributedText = NSMutableAttributedString.underline(withText: self.text)
    }
    
    /// Applies underline attribute for the text displayed by the label with a given color.
    func underline(color: UIColor) {
        self.attributedText = NSMutableAttributedString.underline(withText: self.text, color: color)
    }
    
    
    /// Sets the color of charactors displayed by the label within a given range.
    func setTextColor(_ color: UIColor, range: NSRange) {
        let attributedText = NSMutableAttributedString(string: self.text ?? "")
        attributedText.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
        self.attributedText = attributedText
    }
    
    func setTextColors(_ colors: [UIColor], ranges: [NSRange]) {
        
        let attributedText = NSMutableAttributedString(string: self.text ?? "")
        
        // Check that colors and ranges contain the same number of items.
        jf_assert(colors.count == ranges.count, "Colors and Ranges must contain the same number of items")
        
        for (idx, _) in colors.enumerated() {
            attributedText.addAttribute(NSForegroundColorAttributeName, value: colors[idx], range: ranges[idx])
        }
        
        self.attributedText = attributedText
    }
}
