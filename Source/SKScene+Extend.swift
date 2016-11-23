//
//  SKScene+Extend.swift
//  dinner517
//
//  Created by sheldon on 16/3/29.
//  Copyright © 2016年 anglesoft. All rights reserved.
//


import SpriteKit
import UIKit

extension SKScene {
    
    var center: CGPoint {
        return CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
    }
}
