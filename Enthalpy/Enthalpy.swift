//
//  Enthalpy.swift
//  UnitConversions
//
//  Created by Michael Housh on 10/4/17.
//

import Foundation

struct Enthalpy {
    
    let temperature: Temperature
    let humidity: RelativeHumidity
    var pressure: Pressure
    
    // MARK: Initialization
    init(temperature: Temperature, humidity: RelativeHumidity,
         pressure: Pressure = .forAltitude(altitude: Length(0.0))) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
    }
    
    // Conveninence to initialize with altitude
    // and optional altitude type (default is feet).
    init(temperature: Temperature, humidity: RelativeHumidity,
         altitude: Double, altitudeType: LengthType = .feet) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = Pressure.forAltitude(altitude: Length(altitude, type: altitudeType))
    }
}


// MARK: Valuable

extension Enthalpy: Valuable {
    // Calculate the partial vapor pressure
    // based on parameters set on the instance.
    var partialPressure: Double {
        // The partial vapor pressure based on the temperature and humidity set on the instance.
        let rankineTemperature = self.temperature.convert(to: .rankine).value
        let naturalLog = log(rankineTemperature)
        let x = -10440.4 / rankineTemperature - 11.29465 - 0.02702235 * rankineTemperature + 1.289036e-5 * pow(rankineTemperature, 2) - 2.478068e-9 * pow(rankineTemperature, 3) + 6.545967 * naturalLog
        return humidity.value * exp(x)
    }
    
    // Calculate the humidity ratio
    // based on parameters set on the instance.
    var humidityRatio: Double {
        return 0.62198 * partialPressure / (pressure.value - partialPressure)
    }
    
    // Calculte the enthalpy
    // based on parameters set on the instance.
    var value: Double {
        let temperature = self.temperature.convert(to: .fahrenheit).value
        return 0.24 * temperature + humidityRatio * (1061 + 0.444 * temperature)
    }
}
