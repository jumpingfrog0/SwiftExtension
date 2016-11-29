//
//  UIApplication+Extend.swift
//  dinner517
//
//  Created by sheldon on 15/9/1.
//  Copyright (c) 2015年 anglesoft. All rights reserved.
//

import UIKit

extension UIApplication {
    
    
    /// Return the visible key window of application.
    /// This property can be using in `viewDidLoad` method.
    ///
    /// The view of root view controller is not appeared in the view hierarchy when `viewDidLoad` method calling, which result in key window being invisiable and nil, so should use the `.window` property of the `AppDelegate`.
    var visibleKeyWindow: UIWindow? {
        if let window = UIApplication.shared.keyWindow {
            return window
        } else {
            guard let window = UIApplication.shared.delegate?.window else {
                return nil
            }
            return window
        }
    }
    
    /// Returns the most top view controller excepts `UIAlertController`
    public func mostTopViewController() -> UIViewController {
        
        var topController = visibleKeyWindow?.rootViewController
        
        jf_assert(topController != nil, "The root view controller of keywindow is not existed.")
        
        if topController is UINavigationController {
            
            return (topController as! UINavigationController).visibleViewController!
            
        } else if topController is UITabBarController {
            
            let tabBarController = topController as! UITabBarController
            
            if let selectedViewController = tabBarController.selectedViewController {
                
                return selectedViewController
                
            } else {
                return tabBarController.viewControllers![0]
            }
            
        } else { // UIViewController
            
            while let presentedViewController = topController?.presentedViewController {
                
                if presentedViewController is UIAlertController { // skip `UIAlertController`
                    break
                }
                topController = presentedViewController
            }
            
            return topController!
        }
    }
}
