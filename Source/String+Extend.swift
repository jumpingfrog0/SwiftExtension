//
//  String+Extend.swift
//  517Driver
//
//  Created by sheldon on 15/7/17.
//  Copyright (c) 2015年 517. All rights reserved.
//

import Foundation

// MARK: - String+Format
extension String {
    static func stringFromTimeIntervalSince1970(_ time: TimeInterval, format: String) -> String?{
        let date: Date = Date(timeIntervalSince1970: time)
        return date.toString(format)
    }
    
    // transform timestamp that accurate to microsecond to string
    static func stringFromTimeIntervalAccurateToMicrosecond(_ time: TimeInterval, format: String) -> String?{
        return self.stringFromTimeIntervalSince1970(time / 100_0000, format: format)
    }
    
    func date(_ format: String) -> Date? {
        getDateFormatter().dateFormat = format
        return getDateFormatter().date(from: self)
    }
    
    func dateFromTimestamp(_ ts: TimeInterval) -> Date? {
        return Date(timeIntervalSince1970: ts)
    }
    
    var toFloat: Float {
        return (self as NSString).floatValue
    }
    
    var toInt: Int {
        return (self as NSString).integerValue
    }
    
    var toDouble: Double {
        return (self as NSString).doubleValue
    }
    
    var length: Int {
        return self.characters.count
    }
}

// MARK: - SubString

extension String: Collection {
    
    func substringFromIndex(_ index: Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: index))
    }
    
    func substringToIndex(_ index: Int) -> String {
        return self.substring(to: self.characters.index(self.endIndex, offsetBy: index - self.length))
    }
    
    func substringWithRange(_ range: Range<Int>) -> String {
        let start = self.characters.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.characters.index(self.startIndex, offsetBy: range.upperBound)
        return self.substring(with: start..<end)
    }
    
    func contains(_ s: String) -> Bool {
        return self.range(of: s) != nil
    }
    
    func matchRegex(_ regex: String) -> Bool {
        if let _ = self.range(of: regex, options: .regularExpression) {
            return true
        } else {
            return false
        }
    }
}

// MARK: - String+Other
extension String {
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil)
        return boundingBox.height
    }
    
    func heightWithConstrainedWidth(_ width: CGFloat, systemFontSize size: CGFloat) -> CGFloat {
        return heightWithConstrainedWidth(width, font: UIFont.systemFont(ofSize: size))
    }
    
    func maxWidthWithFont(_ font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil)
        return boundingBox.width
    }
    
    func maxWidthWithSystemFontSize(_ size: CGFloat) -> CGFloat {
        return maxWidthWithFont(UIFont.systemFont(ofSize: size))
    }
    
    // check whether contains Chinese
    var containsChineseCharacters: Bool {
        return range(of: "\\p{Han}", options: .regularExpression) != nil
    }
}

extension NSAttributedString {
    func heightWithConstrainedWidth(_ width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
}

extension NSMutableAttributedString {
    class func strikethroughWithString(_ text: String?) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: text ?? "")
        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
