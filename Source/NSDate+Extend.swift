//
//  NSDate+Extend.swift
//  517Driver
//
//  Created by sheldon on 15/7/16.
//  Copyright (c) 2015年 517. All rights reserved.
//

import Foundation
//import Timepiece

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

enum TimestampPrecision {
    case second
    case microsecond
}

extension Date {
    
    func toString(_ format: String) -> String {
        getDateFormatter().dateFormat = format
        return getDateFormatter().string(from: self)
    }
    
    /**
    This method return a NSDate object that the begin time of one date,such as 2015-07-31 00:00:00
    This method can calculate a date of 0:00 and return
    
    - parameter fromTimestamp: The timestamp of date that you want to calculate or convert
    - parameter precisionType: The Precision of the param 'fromTimestamp'
    */
    static func beginOfDate(_ fromTimestamp: TimeInterval, precisionType: TimestampPrecision) -> Date {
        var date: Date!
        switch precisionType {
        case .microsecond:
            date = Date(timeIntervalSince1970: fromTimestamp / 100_0000)
        case .second:
            date = Date(timeIntervalSince1970: fromTimestamp)
        }
        
        let calendar = Calendar.current
        return calendar.startOfDay(for: date)
    }
    
    static func beginOfToday() -> Date {
       return self.beginOfDate(Date().timeIntervalSince1970, precisionType: TimestampPrecision.second)
    }
}

extension TimeInterval {
    func convertPrecisionType(from: TimestampPrecision, to: TimestampPrecision) -> TimeInterval {
        switch (from, to) {
        case (.microsecond, .second):
            return Date(timeIntervalSince1970: self / 100_0000).timeIntervalSince1970
        default:
            jf_assert(false, "Convert failed. Not valid parameters.")
            return self
        }
    }
    
    func date() -> Date {
        return Date(timeIntervalSince1970: self)
    }
    
    func begionOfTimestamp(precisionType: TimestampPrecision) -> TimeInterval {
        var timestamp: TimeInterval!
        switch precisionType {
        case .microsecond:
            timestamp = Date.beginOfDate(self, precisionType: TimestampPrecision.microsecond).timeIntervalSince1970 * 100_0000
        case .second:
            timestamp = Date.beginOfDate(self, precisionType: TimestampPrecision.second).timeIntervalSince1970
        }
        return timestamp
    }
}
