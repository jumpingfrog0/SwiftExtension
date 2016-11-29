//
//  UINavigationBar+Extend.swift
//  dinner517
//
//  Created by sheldon on 15/9/12.
//  Copyright (c) 2015年 anglesoft. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    fileprivate struct AssociatedKeys {
        static var overlayKey = "sw_overlayKey"
    }
    
    /// A layer cover above `UINavigationBar`, using to change background color of navigation bar etc.
    fileprivate var overlay: UIView? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.overlayKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.overlayKey) as? UIView
        }
    }
    
    /// Set background color of navigation bar.
    func jf_setBackgroundColor(_ backgroundColor: UIColor) {
        if overlay == nil {
            setBackgroundImage(UIImage(), for: .default)
            shadowImage = UIImage()
            overlay = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: self.bounds.height + 20))
            overlay?.isUserInteractionEnabled = false
            overlay?.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
            insertSubview(overlay!, at: 0)
        }
        
        overlay?.backgroundColor = backgroundColor
    }
    
    /// Recover the origin style of navigation bar.
    func jf_reset() {
        self.setBackgroundImage(nil, for: .default)
        overlay?.removeFromSuperview()
        overlay = nil
    }
}
