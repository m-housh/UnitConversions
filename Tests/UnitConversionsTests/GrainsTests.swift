//
//  GrainsTests.swift
//  UnitConversionsTests
//
//  Created by Michael Housh on 8/19/18.
//

import XCTest

@testable import UnitConversions


final class GrainsTests: XCTestCase {
    
    let temperature = Temperature(75, type: .fahrenheit)
    let humidity = RelativeHumidity(percent: 50)
    
    var grains: Grains {
        return Grains(temperature: temperature, humidity: humidity)
    }
    
    func testGrains() {
        let expected = 65.9
        var value = round(grains.value * 100) / 100
        XCTAssertEqual(value, expected)
        
        value = round(temperature.grains(humidity: humidity).value * 100) / 100
        XCTAssertEqual(value, expected)

    }
}
