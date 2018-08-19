//
//  DewPoint.swift
//  UnitConversions
//
//  Created by Michael Housh on 8/19/18.
//

import Foundation

/// Calculate's the Dew-Point based on temperature and humidity.
public struct DewPoint {
    
    public let temperature: Temperature
    public let humidity: RelativeHumidity
    
    public init(temperature: Temperature, humidity: RelativeHumidity) {
        self.temperature = temperature
        self.humidity = humidity
    }
}

extension DewPoint: Valuable {
    
    public var value: Double {
        let naturalLog = log(humidity.value)
        let t = temperature.convert(to: .celsius).value
        
        let value = 243.04 * (naturalLog + ((17.625 * t) / (243.04 + t))) / (17.625 - naturalLog - ((17.625 * t) / (243.04 + t)))
        
        return Temperature(value, type: .celsius).convert(to: temperature.type).value
        
    }
}

extension Temperature {
    
    public func dewPoint(humidity: RelativeHumidity) -> DewPoint {
        return DewPoint(temperature: self, humidity: humidity)
    }
}
