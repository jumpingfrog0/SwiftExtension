//
//  LogMacros.swift
//  517Driver
//
//  Created by sheldon on 15/8/26.
//  Copyright (c) 2015年 517. All rights reserved.
//

import Foundation

/**
This method is called using `MyAppName.println()`, where MyAppName is the name of your .xcodeproj file.
Writes the textual representation of `object` and a newline character into the standard output.
The textual representation is obtained from the `object` using its protocol conformances,
in the following order of preference: `Streamable`, `Printable`, `DebugPrintable`.
This functional also augments the original function with the filename, function name, and line number of the object that is being logged.
:param: object   A textual representation of the object.
:param: file     Defaults to the name of the file that called println(). Do not override this default.
:param: function Defaults to the name of the function within the file in which println() was called. Do not override this default.
:param: line     Defaults to the line number within the file in which println() was called. Do not override this default.
*/
public func SWLog<T>(_ object: T, _ file: String = #file, _ function: String = #function, _ line: Int = #line)
{
    #if DEBUG
        let now = Date().toString("yyyy-MM-dd HH-mm-ss.SSS")
        let bundleName = Bundle.main.bundleName
//        let filename = ((file as NSString).lastPathComponent as NSString).stringByDeletingPathExtension
//        print("\(now) [\(bundleName!)] \(filename).\(function) [line \(line)]: \(object)\n")
        print("\(now) [\(bundleName!)] \(file).\(function) [line \(line)]: \(object)\n")
    #endif
}

public func SWAssert(_ condition: @autoclosure () -> Bool, _ message: String = "",
    file: String = #file, line: Int = #line) {
        #if DEBUG
            if !condition() {
            print("assertion failed at \(file):\(line): \(message)")
            abort()
            }
        #endif
}

public func SWLogJSON(_ json: [String : AnyObject]) {
    do {
        let data = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
        let strJson = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
        SWLog( "LogJson ---- " + "\(strJson)")
    } catch _ {
        
        SWLog(" LogJson ---- json can not be serialized, please check the formatter.")
    }
    
}
