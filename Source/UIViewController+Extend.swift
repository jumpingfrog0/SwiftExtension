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
    
    /// The window application is expected to use. Never be nil.
    /// `UIApplication.shared.keywindow` is the window which is currently being displayed on the device, this is normally the application's window, but it could be nil if has not been visible, such as at the time of application is launching.
    /// See more: http://stackoverflow.com/questions/21698482/diffrence-between-uiapplication-sharedapplication-delegate-window-and-u
    var window: UIWindow! {
        return UIApplication.shared.delegate?.window!
    }
    
    
    /// Instantiate the view controller from a given storyboard. You must set the identifier for the view controller in Interface Builder when configuring the storyboard file firstly, or that will crash.
    static func instantiate(fromStoryboard storyboardName: String) -> Self {
        let object: AnyObject = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: entityName())
        return objcast(object)
    }
    
    
    /// Returns the class name of view controller
    class func entityName() -> String {
        let classString = NSStringFromClass(self)
        // The entity is the last component of dot-separated class name
        let components = classString.characters.split { $0 == "." }.map { String($0) }
        return components.last ?? classString
    }
    
    
    /// Cast the appropriate type of a given object.
    /// The compiler infers the type of object correctly as `YourEntity`.
    /// See more: http://stackoverflow.com/questions/27109268/how-can-i-create-instances-of-managed-object-subclasses-in-a-nsmanagedobject-swi
    class func objcast<T>(_ obj: AnyObject) -> T {
        return obj as! T
    }
    
    /// Cast the appropriate type of a given object.
    /// The compiler infers the type of object correctly as `YourEntity`.
    /// See more: http://stackoverflow.com/questions/27109268/how-can-i-create-instances-of-managed-object-subclasses-in-a-nsmanagedobject-swi
    func objcast<T>(_ obj: AnyObject?) -> T? {
        return obj as! T?
    }
}

// MARK: - Hide TabBar

extension UIViewController {
    
    /// Hide tab bar without using `hidesBottomBarWhenPushed`.
    /// See more: http://stackoverflow.com/questions/5272290/how-to-hide-uitabbarcontroller
    func hideTabBar(of tabBarController: UITabBarController) {
        
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
    
    /// Show tab bar.
    /// See more: http://stackoverflow.com/questions/5272290/how-to-hide-uitabbarcontroller
    func showTabBar(of tabBarController: UITabBarController) {
        let screenRect = UIScreen.main.bounds
        
        var height = screenRect.size.height - tabBarController.tabBar.frame.size.height
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            height = screenRect.size.width - tabBarController.tabBar.frame.size.height
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


