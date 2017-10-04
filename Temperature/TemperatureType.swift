//
//  TemperatureType.swift
//  UnitConversions
//
//  Created by Michael Housh on 10/4/17.
//

public enum TemperatureType: Symbolic {
    case fahrenheit, celsius, kelvin, rankine
    
    public var symbol: String {
        switch self {
        case .celsius:
            return "°C"
        case .fahrenheit:
            return "°F"
        case .kelvin:
            return "°K"
        case .rankine:
            return "°R"
            
        }
    }
}
