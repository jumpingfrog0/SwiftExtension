//
//  UILabel+Extend.swift
//  dinner517
//
//  Created by sheldon on 15/11/20.
//  Copyright (c) 2015年 anglesoft. All rights reserved.
//

import UIKit

extension UILabel {
    func strikethrough() {
        self.attributedText = NSMutableAttributedString.strikethroughWithString(self.text)
    }
    
    func setTextColor(_ color: UIColor, range: NSRange) {
        let attributedText = NSMutableAttributedString(string: self.text ?? "")
        attributedText.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
        self.attributedText = attributedText
    }
}
