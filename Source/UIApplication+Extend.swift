//
//  UIApplication+Extend.swift
//  dinner517
//
//  Created by sheldon on 15/9/1.
//  Copyright (c) 2015年 anglesoft. All rights reserved.
//

import UIKit

extension UIApplication {
    
    public func getWindowWithWindowLevelNormal() -> UIWindow {
        let windows = UIApplication.shared.windows
        for topWindow in windows {
            if topWindow.windowLevel == UIWindowLevelNormal {
                return topWindow 
            }
        }
        return UIApplication.shared.keyWindow!
    }
    
    public func mostTopViewController() -> UIViewController {
        
        var topWindow = UIApplication.shared.keyWindow
        if topWindow?.windowLevel != UIWindowLevelNormal {
            topWindow = self.getWindowWithWindowLevelNormal()
        }
        
        var topVisibleController = topWindow?.rootViewController
        
        if topVisibleController == nil {
            topWindow = UIApplication.shared.delegate?.window!
            if topWindow!.windowLevel != UIWindowLevelNormal {
                topWindow = self.getWindowWithWindowLevelNormal()
            }
            topVisibleController = topWindow?.rootViewController
        }
        
        if topVisibleController?.isKind(of: UINavigationController.self) == true {
            let navigationController = topVisibleController as! UINavigationController
            topVisibleController = navigationController.visibleViewController
        } else if topVisibleController?.isKind(of: UITabBarController.self) == true {
            let tabBarController = topVisibleController as! UITabBarController
            topVisibleController = tabBarController.selectedViewController
        }
        
        while let presentedViewController = topVisibleController!.presentedViewController {
            topVisibleController = presentedViewController
        }
        
        return topVisibleController!
    }
    
//    public func mostTopViewController() -> UIViewController {
//        return topViewControllerWithRootViewController(getWindowWithWindowLevelNormal().rootViewController!)
//    }
//    
//    public func topViewControllerWithRootViewController(rootViewController: UIViewController) -> UIViewController {
//        if rootViewController.isKindOfClass(UITabBarController) == true {
//            let tabBarController = rootViewController as! UITabBarController
//            return topViewControllerWithRootViewController(tabBarController.selectedViewController!)
//        } else if rootViewController.isKindOfClass(UINavigationController) == true {
//            let navigationController = rootViewController as! UINavigationController
//            return topViewControllerWithRootViewController(navigationController.visibleViewController)
//        } else if rootViewController.presentingViewController != nil {
//            let presentedViewController = rootViewController.presentingViewController
//            return topViewControllerWithRootViewController(presentedViewController!)
//        } else {
//            let subviews = rootViewController.view.subviews as! [UIView]
//            for view in subviews {
//                let subViewController = view.nextResponder()
//                if (subViewController != nil && (subViewController?.isKindOfClass(UIViewController) == true)) {
//                    return topViewControllerWithRootViewController(subViewController as! UIViewController)
//                }
//            }
//            return rootViewController
//        }
//    }
    
}
