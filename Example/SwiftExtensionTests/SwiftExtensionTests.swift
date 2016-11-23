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
    
}
