//
//  RelativeHumidityTests.swift
//  UnitConversionsTests
//
//  Created by Michael Housh on 10/4/17.
//

import XCTest

@testable import UnitConversions

class RelativeHumidityTests: XCTestCase {
    
    func testAsPercent() {
        let humidity = RelativeHumidity(percent: 50.0)
        XCTAssertEqual(0.50, humidity.value)
        XCTAssertEqual("50.0 %", humidity.description)
    }
    
    func testAsDecimal() {
        let humidity = RelativeHumidity(decimal: 0.5)
        XCTAssertEqual(0.50, humidity.value)
        XCTAssertEqual("50.0 %", humidity.description)
    }
    
    func testEquatable() {
        let percent = RelativeHumidity(percent: 50.0)
        let decimal = RelativeHumidity(decimal: 0.5)
        XCTAssert(percent == decimal)
    }
    
    static var allTests = [
        ("testAsPercent", testAsPercent),
        ("testAsDecimal", testAsDecimal),
        ("testEquatable", testEquatable)
    ]
}
