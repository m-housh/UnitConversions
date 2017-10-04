//
//  TemperatureConversionTests.swift
//  UnitConversionsTests
//
//  Created by Michael Housh on 10/4/17.
//
import XCTest
@testable import UnitConversions

// TODO:  These need updated with the `ExpectedContainer`

typealias ExpectedTemperature = ExpectedContainer<TemperatureType>

class TemperatureTests: XCTestCase {
    
    func testTemperatureAsString() {
        let fahrenheit = Temperature(75.0, type: .fahrenheit)
        XCTAssertEqual(fahrenheit.description, "75.0 °F")
        
        let celsius = Temperature(75.0, type: .celsius)
        XCTAssertEqual(celsius.description, "75.0 °C")
        
        let kelvin = Temperature(75.0, type: .kelvin)
        XCTAssertEqual(kelvin.description, "75.0 °K")
        
        let rankine = Temperature(75.0, type: .rankine)
        XCTAssertEqual(rankine.description, "75.0 °R")
        
    }
    
    func testTemperatureEquatable() {
        let types: [TemperatureType] = [.fahrenheit, .celsius, .kelvin, .rankine]
        
        var one: Temperature
        var two: Temperature
        
        for type in types {
            one = Temperature(75.0, type: type)
            two = Temperature(75.0, type: type)
            XCTAssertTrue(one == two)
        }
        
        one = Temperature(75.0)
        two = Temperature(76.0)
        XCTAssertTrue(one != two)
        
        two = Temperature(75.0, type: .celsius)
        XCTAssertTrue(one != two)
        
    }
    
    func testTemperatureConversionToFahrenheit() {
        let celsius = Temperature(75.0, type: .celsius)
        var fahrenheit = celsius.convert(to: .fahrenheit)
        XCTAssertEqual(round(fahrenheit.value), 167)
        
        let kelvin = Temperature(75.0, type: .kelvin)
        fahrenheit = kelvin.convert(to: .fahrenheit)
        XCTAssertEqual(round(fahrenheit.value), -325)
        
        let rankine = Temperature(75.0, type: .rankine)
        fahrenheit = rankine.convert(to: .fahrenheit)
        XCTAssertEqual(round(fahrenheit.value), -385)
        
        let fahrenheitTest = Temperature(75.0)
        fahrenheit = fahrenheitTest.convert(to: .fahrenheit)
        XCTAssertEqual(fahrenheit.value, fahrenheitTest.value)
    }
    
    func testConversionToCelsius() {
        let fahrenheit = Temperature(75.0)
        var celsius = fahrenheit.convert(to: .celsius)
        XCTAssertEqual(round(celsius.value), 24)
        
        let kelvin = Temperature(75.0, type: .kelvin)
        celsius = kelvin.convert(to: .celsius)
        XCTAssertEqual(round(celsius.value), -198)
        
        let rankine = Temperature(75.0, type: .rankine)
        celsius = rankine.convert(to: .celsius)
        XCTAssertEqual(round(celsius.value), -231)
        
        let celsiusTest = Temperature(75.0, type: .celsius)
        celsius = celsiusTest.convert(to: .celsius)
        XCTAssertEqual(celsius.value, 75.0)
        
    }
    
    func testConversionToKelvin() {
        let fahrenheit = Temperature(75.0)
        var kelvin = fahrenheit.convert(to: .kelvin)
        XCTAssertEqual(round(kelvin.value), 297)
        
        let celsius = Temperature(75.0, type: .celsius)
        kelvin = celsius.convert(to: .kelvin)
        XCTAssertEqual(round(kelvin.value), 348)
        
        let rankine = Temperature(75.0, type: .rankine)
        kelvin = rankine.convert(to: .kelvin)
        XCTAssertEqual(round(kelvin.value), 42)
        
        let kelvinTest = Temperature(75.0, type: .kelvin)
        kelvin = kelvinTest.convert(to: .kelvin)
        XCTAssertEqual(kelvin.value, 75.0)
        
    }
    
    func testConversionToRankine() {
        let fahrenheit = Temperature(75.0)
        var rankine = fahrenheit.convert(to: .rankine)
        XCTAssertEqual(round(rankine.value), 535)
        
        let celsius = Temperature(75.0, type: .celsius)
        rankine = celsius.convert(to: .rankine)
        XCTAssertEqual(round(rankine.value), 627)
        
        let kelvin = Temperature(75.0, type: .kelvin)
        rankine = kelvin.convert(to: .rankine)
        XCTAssertEqual(round(rankine.value), 135)
        
        let rankineTest = Temperature(75, type: .rankine)
        rankine = rankineTest.convert(to: .rankine)
        XCTAssertEqual(rankine.value, 75.0)
    }
    
    static var allTests = [
        ("testAsString", testTemperatureAsString),
        ("testTemperatureEquatble", testTemperatureEquatable),
        ("testConversionToFahrenheit", testTemperatureConversionToFahrenheit),
        ("testConversionToCelsius", testConversionToCelsius),
        ("testConversionToKelvin", testConversionToKelvin),
        ("testConversionToRankine", testConversionToRankine),
        ]
}
