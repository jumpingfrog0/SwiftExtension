//
//  SwiftExtensionTests.swift
//  SwiftExtension
//
//  Created by jumpingfrog0 on 01/12/2016.
//
//
//  Copyright (c) 2016 Jumpingfrog0 LLC
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import XCTest
@testable import SwiftExtension

class SwiftExtensionTests: XCTestCase {
    
    func testArray() {
        var array = [0, 1, 2, 2, 3]
        
        XCTAssertEqual(array.indexOfObject(0), 0)
        XCTAssertEqual(array.indexesOfObject(2)!, [2, 3])
        XCTAssertTrue(array.removeObject(3), "Remove object failed.")
    }
    
    func testBundle() {
        XCTAssertEqual(Bundle.main.bundleName, "SwiftExtension")
        XCTAssertEqual(Bundle.main.bundleShortVersion, "1.0.0")
        XCTAssertEqual(Bundle.main.bundleBuildVersion, "1")
        XCTAssertEqual(Bundle.main.bundleExecuteable, "SwiftExtension")
    }
    
    func testDate() {
        
        let date1 = Date(timeIntervalSince1970: 1480050791) // 2016/11/25 13:13:11
        let date2 = Date(timeIntervalSince1970: 1480003200) // 2016/11/25 00:00:00
        
        XCTAssertEqual(date1.toString("yyyy/MM/dd HH:mm:ss"), "2016/11/25 13:13:11")
        XCTAssertEqual(Date.startOfDay(forTimestamp: 1480050791), date2)
        XCTAssertEqual(Date.startOfToday(), Date.startOfDay(forTimestamp: Date().timeIntervalSince1970))
    }
    
    func testNumber() {
        // Int
        let num = 10
        let seconds = 4000
        
        XCTAssertEqual(num.format("003"), "010")
        XCTAssertEqual(num.toString(), "10")
        XCTAssertEqual(seconds.timeFormatted(), "01:06:40")
        XCTAssertEqual(seconds.timeFormattedExceptSeconds(), "01:06")
        
        // Double
        XCTAssertEqual(Double(12.3456).format(".2"), "12.35")
        XCTAssertEqual(Double(12.3456).toString(), "12.3456")
        
        // Float
        XCTAssertEqual(Float(12.3456).format(".2"), "12.35")
        XCTAssertEqual(Float(12.3456).toString(), "12.3456")
    }
    
    func testStack() {
        var stack = Stack<String>()
        stack.push("one")
        stack.push("two")
        
        let arrayOfStrings = ["one", "two"]
        
        // match
        XCTAssertTrue(allItemsMatch(stack, arrayOfStrings), "Not all items match.")
        
        // top item
        XCTAssertEqual(stack.topItem, "two")
        
        // pop
        let item = stack.pop()
        XCTAssertEqual(item, "two")
        
        XCTAssertFalse(stack.isEmpty, "stack is empty")
        XCTAssertEqual(stack.count, 1)
        XCTAssertEqual(stack[0], "one")
        
    }
    
    func testString() {
        // Format
        let str = "2016-12-31 13:01:30"
        let ts = TimeInterval(1483160490) // "2016-12-31 12:01:30"
        let date = str.date(fromFormat: "yyyy-MM-dd HH:mm:ss")
        XCTAssertEqual(date!.timeIntervalSince1970, ts)
        
        XCTAssertEqual("12.34".toFloat, Float(12.34))
        XCTAssertEqual("12.34".toDouble, Double(12.34))
        XCTAssertEqual("12".toInt, Int(12))
        XCTAssertEqual("abcdefg".length, 7)
        
        // Substring
        XCTAssertEqual("0123456".substring(fromIndex: 3), "3456")
        XCTAssertEqual("0123456".substring(toIndex: 3), "012")
        XCTAssertEqual("0123456".substring(withRange: 1..<5), "1234")
        XCTAssertTrue("0123www456".contains("www"), "Not contain the specified string")
        XCTAssertTrue("我是中国人".containsChineseCharacters, "Not contain Chinese characters.")
        XCTAssertTrue("15986934725".match(ofRegex: "159"), "Not match the regular expression.")
    }

}

extension Array: Container {}
