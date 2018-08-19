//
//  WetBulbTests.swift
//  UnitConversionsTests
//
//  Created by Michael Housh on 8/19/18.
//

import XCTest

@testable import UnitConversions


final class WetBulbTests: XCTestCase {
    
    let temperature = Temperature(75, type: .fahrenheit)
    let humidity = RelativeHumidity(percent: 50)
    
    var wetbulb: WetBulb {
        return WetBulb(temperature: temperature, humidity: humidity)
    }
    
    func testWetBulb() {
        var value = round(wetbulb.value * 100) / 100
        let expected = 62.51
        XCTAssertEqual(value, expected)
        
        value = round(temperature.wetBulb(humidity: humidity).value * 100) / 100
        
        XCTAssertEqual(value, expected)
        
    }
}
