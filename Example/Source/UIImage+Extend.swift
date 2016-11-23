//
//  UIImage+Extend.swift
//  517Driver
//
//  Created by sheldon on 15/12/23.
//  Copyright (c) 2015年 517. All rights reserved.
//

import UIKit
import QuartzCore

extension UIImage {
    class func imageWithTitle(_ title: String, frame: CGRect, backgroudColor: UIColor, textColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, true, 0.0)
        backgroudColor.set()
        UIRectFill(CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        label.textColor = textColor
        label.textAlignment = .center
        label.text = title
        label.drawText(in: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
//    class func markerWithTitle(_ title: String, frame: CGRect, backgroudColor: UIColor, textColor: UIColor) -> UIImage {
//        let triangleWith = CGFloat(14)
//        let size = CGSize(width: frame.width, height: frame.height + triangleWith / 2)
//        
//        // draw title
//        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
//        backgroudColor.set()
//        UIRectFill(CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
//        
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
//        label.textColor = textColor
//        label.textAlignment = .center
//        label.text = title
//        label.drawText(in: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
//        
//        // draw a transparent layer
//        let ctx = UIGraphicsGetCurrentContext()
//        ctx?.addRect(CGRect(x: 0, y: frame.height, width: frame.width, height: triangleWith / 2))
//        UIColor.clear.set()
//        ctx?.fillPath()
//        
//        // draw a triangle
//        backgroudColor.set()
//        
//        let path = CGMutablePath()
//        CGPathMoveToPoint(path, nil, (frame.width - triangleWith) / 2, frame.height)
//        CGPathAddLineToPoint(path, nil, frame.width / 2, frame.height + triangleWith / 2)
//        CGPathAddLineToPoint(path, nil, (frame.width + triangleWith) / 2, frame.height)
//        path.closeSubpath()
//        
//        ctx?.addPath(path)
//        ctx?.fillPath()
//        
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return newImage!
//    }
    
    /**
     return a image that can be stretched random and no deformation
     */
    class func resizableImage(_ imageName: String) -> UIImage{
        let normal = UIImage(named: imageName)
        let w = normal!.size.width * 0.5
        let h = normal!.size.height * 0.5
        return normal!.resizableImage(withCapInsets: UIEdgeInsetsMake(h, w, h, w), resizingMode: .stretch)
    }
    
    /**
     capture of view
     */
    class func captureWithView(_ view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let clipImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return clipImage!
    }
    
    /**
    clip a image in rect
    */
    func clippedImageWithRect(_ bounds: CGRect) -> UIImage {
        let scale = max(self.scale, 1.0)
        let scaledBounds = CGRect(x: bounds.origin.x * scale, y: bounds.origin.y * scale, width: bounds.size.width * scale, height: bounds.size.height * scale)
        let imageRef = self.cgImage?.cropping(to: scaledBounds)
        let clippedImage = UIImage(cgImage: imageRef!, scale: self.scale, orientation: UIImageOrientation.up)
        return clippedImage
    }
}
