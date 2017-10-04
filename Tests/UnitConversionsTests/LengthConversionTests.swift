//
//  LengthConversionTests.swift
//  UnitConversionsPackageDescription
//
//  Created by Michael Housh on 10/4/17.
//

import XCTest
@testable import UnitConversions

typealias ExpectedLength = ExpectedContainer<LengthType>

class LengthTests: XCTestCase {
    
    func testConvertToInches() {
        let testValue = 34.5
        let expectedValues = [
            ExpectedLength(type: .feet, result: 414),
            ExpectedLength(type: .meters, result: 1358),
            ExpectedLength(type: .centimeters, result: 14)
        ]
        
        for expected in expectedValues {
            let length = Length(testValue, type: expected.type)
            let inches = length.convert(to: .inches)
            XCTAssertEqual(expected.result, round(inches.value))
        }
        
        let inches = Length(testValue)
        let inches2 = Length(testValue)
        XCTAssert(inches == inches2)
        
        XCTAssertEqual("34.5 in", inches.description)
        
    }
    
    func testConvertToFeet() {
        let testValue = 1034.589
        let testType = LengthType.feet
        let expectedValues = [
            ExpectedLength(type: .inches, result: 86),
            ExpectedLength(type: .meters, result: 3394),
            ExpectedLength(type: .centimeters, result: 34)
        ]
        
        for expected in expectedValues {
            let length = Length(testValue, type: expected.type)
            let converted = length.convert(to: testType)
            XCTAssertEqual(expected.result, round(converted.value))
        }
        
        let one = Length(testValue, type: testType)
        let two = Length(testValue, type: testType)
        XCTAssert(one == two)
        
        XCTAssertEqual("1034.589 ft", one.description)
    }
    
    func testConvertToMeters() {
        let testValue = 44.32
        let testType: LengthType = .meters
        
        let expectedValues = [
            ExpectedLength(type: .inches, result: 1.13),
            ExpectedLength(type: .feet, result: 13.51),
            ExpectedLength(type: .centimeters, result: 0.44)
        ]
        
        for expected in expectedValues {
            let length = Length(testValue, type: expected.type)
            let converted = length.convert(to: testType)
            XCTAssertEqual(expected.result,
                           round(converted.value * 100) / 100)
        }
        
        let one = Length(testValue, type: testType)
        let two = Length(testValue, type: testType)
        XCTAssert(one == two)
        
        XCTAssertEqual("44.32 m", one.description)
    }
    
    func testConvertToCentimeters() {
        let testValue = 786.89
        let testType: LengthType = .centimeters
        
        let expectedValues = [
            ExpectedLength(type: .inches, result: 1998.70),
            ExpectedLength(type: .feet, result: 23984.41),
            ExpectedLength(type: .meters, result: 78689.0)
        ]
        
        for expected in expectedValues {
            let length = Length(testValue, expected.type)
            let converted = length.convert(to: testType)
            XCTAssertEqual(expected.result,
                           round(converted.value * 100) / 100)
        }
        
        let one = Length(testValue, type: testType)
        let two = Length(testValue, type: testType)
        XCTAssert(one == two)
        
        XCTAssertEqual("786.89 cm", one.description)
    }
    
    static var allTests = [
        ("testConvertToInches", testConvertToInches),
        ("testConvertToFeet", testConvertToFeet),
        ("testConvertToMeters", testConvertToMeters),
        ("testConvertToCentimeters", testConvertToCentimeters)
        ]
}

