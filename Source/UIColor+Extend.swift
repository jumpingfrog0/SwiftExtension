//
//  UIColor+Extend.swift
//  dinner517
//
//  Created by sheldon on 15/11/17.
//  Copyright (c) 2015年 anglesoft. All rights reserved.
//

import UIKit

extension UIColor {
    
    /* Return the red, green or blue components of the color. */
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}
