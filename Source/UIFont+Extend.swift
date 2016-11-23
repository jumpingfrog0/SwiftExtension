//
//  UIFont+Extend.swift
//  dinner517
//
//  Created by sheldon on 15/10/6.
//  Copyright (c) 2015年 anglesoft. All rights reserved.
//

import Foundation


extension UIFont {
    func printFontNames() {
        for family in UIFont.familyNames {
            print("-----Font Family = \(family)")
            for name in UIFont.fontNames(forFamilyName: family ) {
                print("++++Font Name = \(name)")
            }
        }
    }
}
