//
//  LogMacros.swift
//  517Driver
//
//  Created by sheldon on 15/8/26.
//  Copyright (c) 2015年 517. All rights reserved.
//

import Foundation


/// Writes the textual representations of the given items most suitable for
/// debugging into the standard output. Never perform in Release builds.
///
/// - Parameters:
///   - items: Zero or more items to print.
///   - file: The file name to print items. The default is the file where `jf_print(_:_:_:_:)` is called.
///   - function: The function name to print items. The default is the function where 
///     `jf_print(_:_:_:_:)` is called.
///   - line: The line number to print items. The default is the line number where `jf_print(_:_:_:_:)`
///     is called.
public func jf_print<T>(_ items: T, _ file: String = #file, _ function: String = #function, _ line: Int = #line)
{
    #if DEBUG
        let now = Date().toString("yyyy-MM-dd HH:mm:ss:SSS")
        let bundleName = Bundle.main.bundleName
        let filename = file.split(separator: "/").last
        print("\(now) [\(bundleName!)] \(filename!)(\(line)) \(function) : \(items)")
    #endif
}


/// Performs a traditional C-style assert with an optional message.
///
/// Use this function for internal sanity checks that are active during testing
/// but do not impact performance of shipping code. Never perform in Release builds.
///
/// - Parameters:
///   - condition: The condition to test. `condition` is only evaluated in
///     playgrounds and `-Onone` builds.
///   - message: A string to print if `condition` is evaluated to `false`. The
///     default is an empty string.
///   - function: The function name to print with `message` if the assertion fails. The
///     default is the function where `jf_assert(_:_:_:file:line:)` is called.
///   - file: The file name to print with `message` if the assertion fails. The
///     default is the file where `jf_assert(_:_:_:file:line:)` is called.
///   - line: The line number to print along with `message` if the assertion
///     fails. The default is the line number where `jf_assert(_:_:_:file:line:)`
///     is called.
public func jf_assert(_ condition: @autoclosure () -> Bool, _ message: String = "", _ function: String = #function, file: String = #file, line: Int = #line) {
    #if DEBUG
        if !condition() {
            let now = Date().toString("yyyy-MM-dd HH:mm:ss:SSS")
            let bundleName = Bundle.main.bundleName
            let filename = file.split(separator: "/").last
            print("\(now) [\(bundleName!)] \(filename!)(\(line)) \(function) : [jf assertion failed] \(message)")
            abort()
        }
    #endif
}


/// Writes the textual representation of the given json most suitable for
/// debugging into the standard output. Never perform in Release builds.
///
/// - Parameter json: The json to output into string.
public func jf_printJSON(_ json: [String : AnyObject]) {
    do {
        let data = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
        let strJson = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
        jf_print( "jf_printJson ---- " + "\(strJson)")
    } catch _ {
        
        jf_print(" jf_printJson ---- json can not be serialized, please check the formatter.")
    }
    
}
