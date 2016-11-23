//
//  UIColor+Extend.swift
//  dinner517
//
//  Created by sheldon on 15/11/17.
//  Copyright (c) 2015年 anglesoft. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        let red   = CGFloat(r) / 255
        let green = CGFloat(g) / 255
        let blue  = CGFloat(b) / 255
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}
