//
//  Grains.swift
//  UnitConversions
//
//  Created by Michael Housh on 8/19/18.
//

import Foundation

/// Calculates grains per pound.
public struct Grains {
    
    public let temperature: Temperature
    public let humidity: RelativeHumidity
    
    /// Defaults to sea level
    public let altitude: Length
    
    public let moleWeightWater = 18.02
    public let moleWeightAir = 28.85
    
    public var vaporPressure: Double {
        return Pressure.vaporPressure(temperature, as: .psi).value
    }
    
    public var ambientPressure: Double {
        return Pressure.forAltitude(altitude: altitude, type: .psi).value
    }
    
    public var saturationHumidity: Double {
        return 7000 * (moleWeightWater / moleWeightAir) * vaporPressure / (ambientPressure - vaporPressure)
    }
    
    public init(temperature: Temperature, humidity: RelativeHumidity,
                altitude: Length = Length(0, .feet)) {
        self.temperature = temperature
        self.humidity = humidity
        self.altitude = altitude
    }
}

extension Grains: Valuable {
    
    public var value: Double {
        return saturationHumidity * humidity.value
    }
}


extension Temperature {
   
    public func grains(humidity: RelativeHumidity) -> Grains {
        return Grains(temperature: self, humidity: humidity)
    }
}
