//
//  UIView+Extend.swift
//  dinner517
//
//  Created by sheldon on 15/9/1.
//  Copyright (c) 2015年 anglesoft. All rights reserved.
//

import UIKit

// MARK: - Nib

extension UIView {
    class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    class func loadFromNib() -> UIView? {
        return UINib(nibName: self.className(), bundle: nil).instantiate(withOwner: nil, options: nil).last as? UIView
    }
    
    class func loadFromNibOfIndex(_ idx: Int) -> UIView? {
        var views = UINib(nibName: self.className(), bundle: nil).instantiate(withOwner: nil, options: nil) as? [UIView]
        return views?[idx]
    }
    
    class func className() -> String {
        let classString = NSStringFromClass(self)
        // The entity is the last component of dot-separated class name
        let components = classString.split { $0 == "." }
        return components.last ?? classString
    }
}


// MARK: - Frame

extension UIView {
    func x() -> CGFloat
    {
        return self.frame.origin.x
    }
    
    func setX(_ x: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.x = x
        self.frame = rect
    }
    
    func y() -> CGFloat
    {
        return self.frame.origin.y
    }
    
    func setY(_ y: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.y = y
        self.frame = rect
    }
    
    func width() -> CGFloat
    {
        return self.frame.size.width
    }
    
    func setWidth(_ width: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.size.width = width
        self.frame = rect
    }
    
    func height() -> CGFloat
    {
        return self.frame.size.height
    }
    
    func setHeight(_ height: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.size.height = height
        self.frame = rect
    }
    
    func right() -> CGFloat
    {
        return self.frame.origin.x + self.frame.size.width
    }
    
    func setRight(_ right: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.x = right - rect.size.width
        self.frame = rect
    }
    
    func bottom() -> CGFloat
    {
        return self.frame.origin.y + self.frame.size.height
    }
    
    func setBottom(_ bottom: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.y = bottom - rect.size.height
        self.frame = rect
    }
    
    func midX() -> CGFloat {
        return self.center.x
    }
    
    func setMidX(_ midX: CGFloat) {
        var center = self.center
        center.x = midX
        self.center = center
    }
    
    func midY() -> CGFloat {
        return self.center.y
    }
    
    func setMidY(_ midY: CGFloat) {
        var center = self.center
        center.y = midY
        self.center = center
    }
    
    func setHollowWithCenterFrame(_ centerFrame: CGRect) {
        let path = UIBezierPath()
        path.append(UIBezierPath(rect: self.frame))
        path.append(UIBezierPath(rect: centerFrame).reversing())
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    func setHollowCircleWithCornerRadius(_ radius: CGFloat) {
        
        let rect = CGRect(x: self.center.x - radius, y: self.center.y - radius, width: radius * 2, height: radius * 2)
        
        let path = UIBezierPath()
        path.append(UIBezierPath(rect: self.frame))
        path.append(UIBezierPath(roundedRect: rect, cornerRadius: radius).reversing())
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}

// MARK: - XibConfiguration

extension UIView {
    @IBInspectable var borderColor: UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var masksToBounds: Bool {
        set {
            self.layer.masksToBounds = newValue
        }
        get {
            return self.layer.masksToBounds
        }
    }
    
    /**
     fix up the problem: cornerRadius with border but some glitch at border, you can observe a thin black border line around.
     */
    func borderWithCornerRadius(_ radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        let rect = self.bounds
        
        // Make round
        let maskPath = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = maskPath.cgPath
        
        // Set the newly created shape layer as the mask for the view's layer
        self.layer.mask = maskLayer
        
        // Give Border
        let borderPath = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: radius, height: radius))
        let borderLayer = CAShapeLayer()
        borderLayer.frame = rect
        borderLayer.path = borderPath.cgPath
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = borderWidth
        
        // Add this layer to give border.
        self.layer.addSublayer(borderLayer)
    }

}

// MARK: - Other

extension UIView {
    func removeAllSubviews() {
        //        self.subviews.map { $0.removeFromSuperview() }
        
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
}
