//
//  File.swift
//  UnitConversionsTests
//
//  Created by Michael Housh on 10/4/17.
//

import XCTest

@testable import UnitConversions

class EnthalpyTests: XCTestCase {
    func testEnthalpy() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let temperature = Temperature(75.0, type: .fahrenheit)
        let humidity = RelativeHumidity(percent: 50.0)
        let enthalpy = Enthalpy(temperature: temperature, humidity: humidity)
        XCTAssertEqual(round(enthalpy.value), 28)
    }
    
    func testEnthalpyAtAltitude() {
        let temperature = Temperature(75.0)
        let humidity = RelativeHumidity(percent: 50.0)
        var enthalpy = Enthalpy(temperature: temperature, humidity: humidity, altitude: 0.0)
        XCTAssertEqual(round(enthalpy.value * 10) / 10, 28.1)
        
        enthalpy.pressure = .forAltitude(altitude: Length(1000.0, type: .feet))
        XCTAssertEqual(round(enthalpy.value * 10) / 10, 28.5)
        
    }
    
    
    
    static var allTests = [
        ("testExample", testEnthalpy),
        ("testEnthalpyAtAltitiude", testEnthalpyAtAltitude),
        ]
}

