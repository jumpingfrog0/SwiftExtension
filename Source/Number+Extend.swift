//
//  Number+Extend.swift
//  517Driver
//
//  Created by sheldon on 15/8/23.
//  Copyright (c) 2015年 517. All rights reserved.
//

import Foundation

extension Int {
    
    /// Format a number to string.
    ///     
    ///     let num = 10
    ///     let numStr = num.format("003")
    ///     print(numStr) // 010
    ///
    /// - Parameter format: Format (including number of components) of the attribute
    /// - Returns: A number String formatted.
    func format(_ format: String) -> String {
        return String(format: "%\(format)d", self)
    }
    
    /// Convert a number to string.
    func toString() -> String {
        return "\(self)"
    }
    
    /// Format seconds to human-readable time style string.
    func timeFormatted() -> String {
        let seconds = self % 60
        let minutes = (self / 60) % 60
        let hours = self / 3600
        
        if hours >= 100 {
            return String(format: "%03d:%02d:%02d", hours, minutes, seconds)
        }
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    /// Format seconds to human-readable string with time style except seconds.
    func timeFormattedExceptSeconds() -> String {
        _ = self % 60
        let minutes = (self / 60) % 60
        let hours = self / 3600
        
        if hours >= 100 {
            return String(format: "%03d:%02d", hours, minutes)
        } else {
            return String(format: "%02d:%02d", hours, minutes)
        }
    }
    
    /// Return the length of a number
    func length() -> Int {
        if self == 0 {
            return 1
        }
        return Int(log10(Double(self))) + 1
    }
}

extension Double {
    /// Format a number to string.
    ///
    ///     let num = 10.123456
    ///     let numStr = num.format(".3")
    ///     print(numStr) // 10.123
    ///
    /// - Parameter format: Format (including number of components) of the attribute
    /// - Returns: A number String formatted.
    func format(_ format: String) -> String {
        return String(format: "%\(format)f", self)
    }
    
    /// Convert a number to string.
    func toString() -> String {
        return "\(self)"
    }
}

extension Float {
    /// Format a number to string.
    ///
    ///     let num = 10.123456
    ///     let numStr = num.format(".3")
    ///     print(numStr) // 10.123
    ///
    /// - Parameter format: Format (including number of components) of the attribute
    /// - Returns: A number String formatted.
    func format(_ format: String) -> String {
        return String(format: "%\(format)f", self)
    }
    
    /// Convert a number to string.
    func toString() -> String {
        return "\(self)"
    }
}
