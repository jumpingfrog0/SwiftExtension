//
//  Number+Format.swift
//  517Driver
//
//  Created by sheldon on 15/8/23.
//  Copyright (c) 2015年 517. All rights reserved.
//

import Foundation

extension Int {
    // 1.format(".2")
    func format(_ f: String) -> String {
        return String(format: "%\(f)d", self)
    }
    
    func toString() -> String {
        return "\(self)"
    }
    
    func timeFormatted() -> String {
        let seconds = self % 60
        let minutes = (self / 60) % 60
        let hours = self / 3600
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func timeFormat(_ f: String) -> String {
        _ = self % 60
        let minutes = (self / 60) % 60
        let hours = self / 3600
        
        if f == "HH:mm" {
            return String(format: "%02d:%02d", hours, minutes)
        } else {
            return timeFormatted()
        }
    }
    
    func length() -> Int {
        if self == 0 {
            return 1
        }
        return Int(log10(Double(self))) + 1
    }
}

extension Double {
    // 1.234.format(".2")
    func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
    
    func toString() -> String {
        return "\(self)"
    }
}

extension Float {
    // 1.234.format(".2")
    func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
    
    func toString() -> String {
        return "\(self)"
    }
}
