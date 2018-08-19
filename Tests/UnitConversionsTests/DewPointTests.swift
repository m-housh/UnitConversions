//
//  DewPointTests.swift
//  UnitConversionsTests
//
//  Created by Michael Housh on 8/19/18.
//

import XCTest

@testable import UnitConversions


final class DewPointTests: XCTestCase {
    
    let temperature = Temperature(75.0)
    let humidity = RelativeHumidity(percent: 50.0)
    var dewPoint: DewPoint {
        return DewPoint(temperature: temperature, humidity: humidity)
    }
    
    func testDewPoint() {
        let dp = round(dewPoint.value * 100) / 100
        XCTAssertEqual(dp, 55.11)
        
        let dp2 = round(temperature.dewPoint(humidity: humidity).value * 100) / 100
        XCTAssertEqual(dp2, 55.11)

    }
    
    func testDewPointCelsius() {
        let t = Temperature(23, type: .celsius)
        let Dp = DewPoint(temperature: t, humidity: humidity)
        let dp = round(Dp.value)
        XCTAssertEqual(dp,  12.0)
    }
}
