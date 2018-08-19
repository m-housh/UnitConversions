//
//  Temperature.swift
//  UnitConversions
//
//  Created by Michael Housh on 10/4/17.
//

public struct Temperature {
    // Holds a temperature value and it's type.
    
    public let type: TemperatureType
    public let value: Double
    
    public init(_ value: Double, type temperatureType: TemperatureType = .fahrenheit) {
        self.value = value
        self.type = temperatureType
    }
}

// MARK: TypeConvertible
extension Temperature: TypeConvertible {
    public typealias UnitType = TemperatureType
    
    private func convertToFahrenheit() -> Double {
        // converts `self.value` to fahrenheit.
        // based on the `self.type` value
        switch type {
        case .celsius:
            return value * 9 / 5 + 32
        case .kelvin:
            return value * 9 / 5 - 459.67
        case .rankine:
            return value - 459.67
        default: // we're already fahrenheit
            return value
        }
    }
   
    public func convert(to temperatureType: TemperatureType) -> Temperature {
        
        // holds the converted value that's used for
        // the converted temperature
        let value: Double
        
        // set's the converted value based on the `to temperatureType`
        // passed in (not to be confused with `self.temperatureType`)
        switch temperatureType{
        case .fahrenheit:
            value = convertToFahrenheit()
        case .celsius:
            value = (convertToFahrenheit() - 32) * 5 / 9
        case .kelvin:
            value = (convertToFahrenheit() + 459.67) * 5 / 9
        case .rankine:
            value = convertToFahrenheit() + 459.67
        }
        
        // Create a new `Temperature` with the value and
        // set it's type to the `to temperatureType` that
        // was passed in.
        return Temperature(value, type: temperatureType)
    }
}
