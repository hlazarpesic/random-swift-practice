//
//  UnitTestExamplesTests.swift
//  UnitTestExamplesTests
//
//  Created by Hadži Lazar Pešić on 08/12/2019.
//  Copyright © 2019 Hadži Lazar Pešić. All rights reserved.
//

import XCTest
@testable import UnitTestExamples

class UnitTestExamplesTests: XCTestCase {
    
    func testHelloWorld() {
        var helloWorld: String?
        XCTAssertNil(helloWorld)
        
        helloWorld = "hello world"
        XCTAssertEqual(helloWorld, "hello world")
    }
    
    func testSquareInt() {
        let value = 3
        let squaredValue = value.square()
        XCTAssertEqual(squaredValue, 9)
    }
}
