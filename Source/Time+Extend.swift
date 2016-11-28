//
//  Time+Extend.swift
//  517Driver
//
//  Created by sheldon on 15/7/16.
//  Copyright (c) 2015年 517. All rights reserved.
//

import Foundation

public func getDateFormatter() -> DateFormatter{
    struct Singleton {
        static let formatter: DateFormatter = {
            var formatter = DateFormatter()
            formatter.locale = Locale.current
            return formatter
            }()
    }
    return Singleton.formatter
}

public enum TimestampPrecision {
    case second
    case millisecond
    case microsecond
}

extension Date {
    
    /// Format Date to string.
    ///
    /// - Parameter format: Format (including number of components) of the attribute
    /// - Returns: A String formatted.
    func toString(_ format: String) -> String {
        getDateFormatter().dateFormat = format
        return getDateFormatter().string(from: self)
    }
    
    /// Returns the first moment of a given TimeInterval, as a Date.
    ///
    /// - parameter timestamp: The timestamp of date that you want to calculate or convert
    /// - parameter precision: The precision of the timestamp you pass
    /// - returns: The first moment of the given timestamp.
    static func startOfDay(forTimestamp timestamp: TimeInterval, precision: TimestampPrecision = .second) -> Date {
        var date: Date!
        switch precision {
        case .microsecond:
            date = Date(timeIntervalSince1970: timestamp / 100_0000)
        case .millisecond:
            date = Date(timeIntervalSince1970: timestamp / 1000)
        case .second:
            date = Date(timeIntervalSince1970: timestamp)
        }
        
        return Calendar.current.startOfDay(for: date)
    }
    
    
    /// Returns the first moment of today, as a Date.
    static func startOfToday() -> Date {
       return Calendar.current.startOfDay(for: Date())
    }
}

extension TimeInterval {
    
    /// Convert precision of timestamp
    ///
    /// - Parameters:
    /// - from: The origin timestamp precision
    /// - to: The target timestamp precision
    /// - Returns: The timestamp converted.
    func convertPrecision(from: TimestampPrecision, to: TimestampPrecision) -> TimeInterval {
        switch (from, to) {
        case (.microsecond, .second):
            return Date(timeIntervalSince1970: self / 100_0000).timeIntervalSince1970
        case (.microsecond, .millisecond):
            return Date(timeIntervalSince1970: self / 1000).timeIntervalSince1970
        case (.millisecond, .second):
            return Date(timeIntervalSince1970: self / 1000).timeIntervalSince1970
        case (.second, .microsecond):
            return Date(timeIntervalSince1970: self * 100_0000).timeIntervalSince1970
        case (.second, .millisecond):
            return Date(timeIntervalSince1970: self * 1000).timeIntervalSince1970
        case (.millisecond, .microsecond):
            return Date(timeIntervalSince1970: self * 1000).timeIntervalSince1970
        default:
            jf_assert(false, "Convert failed. Invalid parameters.")
            return self
        }
    }
    
    /// Returns a `Date` initialized relative to 00:00:00 UTC on 1 January 1970 by `self` seconds.
    func date() -> Date {
        return Date(timeIntervalSince1970: self)
    }
}
