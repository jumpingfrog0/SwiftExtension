//
//  SwiftExtensionTests.swift
//  SwiftExtensionTests
//
//  Created by sheldon on 2016/11/23.
//  Copyright © 2016年 jumpingfrog0. All rights reserved.
//

import XCTest
@testable import SwiftExtension

class SwiftExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArray() {
        // Given
        var array = [0, 1, 2, 2, 3]
        
        // When
        let index = array.indexOfObject(0)
        let indexs = array.indexesOfObject(2)
        let isRemoved = array.removeObject(3)
        
        // Then
        XCTAssertEqual(0, index)
        XCTAssertEqual([2, 3], indexs!)
        XCTAssert(isRemoved)
    }
    
    func testBundle() {
        let bundleName = Bundle.main.bundleName
        let shortVersion = Bundle.main.bundleShortVersion
        let buildVersion = Bundle.main.bundleBuildVersion
        let executeable = Bundle.main.bundleExecuteable
        XCTAssertEqual(bundleName, "SwiftExtension")
        XCTAssertEqual(shortVersion, "1.0.0")
        XCTAssertEqual(buildVersion, "1")
        XCTAssertEqual(executeable, "SwiftExtension")
    }
    
    func testDate() {
        
        let date1 = Date(timeIntervalSince1970: 1480050791) // 2016/11/25 13:13:11
        let date2 = Date(timeIntervalSince1970: 1480003200) // 2016/11/25 00:00:00
        
        let dateString = date1.toString("yyyy/MM/dd HH:mm:ss")
        let startOfDay = Date.startOfDay(forTimestamp: 1480050791)
        let startOfToday = Date.startOfToday()
        
        XCTAssertEqual(dateString, "2016/11/25 13:13:11")
        XCTAssertEqual(startOfDay, date2)
        XCTAssertEqual(startOfToday, Date.startOfDay(forTimestamp: Date().timeIntervalSince1970))
    }
    
    func testNumber() {
        // Int
        let num = 10
        let seconds = 4000
        let formattedStr = num.format("003")
        let numStr = num.toString()
        let timeStr = seconds.timeFormatted()
        let timeStr2 = seconds.timeFormattedExceptSeconds()
        
        XCTAssertEqual(formattedStr, "010")
        XCTAssertEqual(numStr, "10")
        XCTAssertEqual(timeStr, "01:06:40")
        XCTAssertEqual(timeStr2, "01:06")
        
        // Double
        XCTAssertEqual(Double(12.3456).format(".2"), "12.35")
        XCTAssertEqual(Double(12.3456).toString(), "12.3456")
        
        // Float
        XCTAssertEqual(Float(12.3456).format(".2"), "12.35")
        XCTAssertEqual(Float(12.3456).toString(), "12.3456")
    }
}
