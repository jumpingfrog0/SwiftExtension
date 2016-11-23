//
//  UIViewController+Extend.swift
//  517Driver
//
//  Created by sheldon on 15/8/7.
//  Copyright (c) 2015年 517. All rights reserved.
//

import UIKit

protocol UIViewControllerStoryboard {
    static func fromStoryboard() -> Self
}

extension UIViewController {
    var window: UIWindow! {
        // keyWindow may be nil
        // see more: http://stackoverflow.com/questions/21698482/diffrence-between-uiapplication-sharedapplication-delegate-window-and-u
//        return UIApplication.sharedApplication().keyWindow
        
        return UIApplication.shared.delegate?.window!
    }
    
    static func fromStoryboard(_ name: String) -> Self {
        let object: AnyObject = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: entityName())
        return objcast(object)
    }
    
    static func initialFromStoryboard(_ name: String) -> Self {
        let object: AnyObject = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        return objcast(object)
    }
    
    class func entityName() -> String {
        let classString = NSStringFromClass(self)
        // The entity is the last component of dot-separated class name
        let components = classString.characters.split { $0 == "." }.map { String($0) }
        return components.last ?? classString
    }
    
    class func objcast<T>(_ obj: AnyObject) -> T {
        return obj as! T
    }
}

// MARK: - Hide TabBar

extension UIViewController {
    // refer to : http://segmentfault.com/q/1010000000395717
    
    func hideTabBar(_ tabBarController: UITabBarController) {
        let screenRect = UIScreen.main.bounds
        
        var height = screenRect.size.height
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            height = screenRect.size.width
        }
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        
        for view in tabBarController.view.subviews {
            if view.isKind(of: UITabBar.self) {
                view.frame = CGRect(x: view.frame.origin.x, y: height, width: view.frame.size.width, height: view.frame.size.height)
            } else {
                view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.size.width, height: height)
                view.backgroundColor = UIColor.black
            }
        }
        
        UIView.commitAnimations()
    }
}


