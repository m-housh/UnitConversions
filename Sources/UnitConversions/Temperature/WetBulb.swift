//
//  WetBulb.swift
//  UnitConversions
//
//  Created by Michael Housh on 8/19/18.
//

import Foundation


public struct WetBulb {
    
    let temperature: Temperature
    let humidity: RelativeHumidity
    
    init(temperature: Temperature, humidity: RelativeHumidity) {
        self.temperature = temperature
        self.humidity = humidity
    }
    
}

extension WetBulb: Valuable {
    
    //((-5.806+0.672×B13−0.006×B13×B13+(0.061+0.004×B13+0.000099×B13×B13)×D11+(-0.000033−0.000005×B13−0.0000001×B13×B13)×D11×D11)
    
    var value: Double {
        let celsius = temperature.convert(to: .celsius).value
        let humidity = self.humidity.value * 100
        let value = (
            (-5.806 + 0.672 * celsius - 0.006 * celsius * celsius +
            (0.061 + 0.004 * celsius + 0.000099 * celsius * celsius) *
            humidity +
            (-0.000033 - 0.000005 * celsius - 0.0000001 * celsius * celsius)
            * humidity * humidity)
        )
        
        return Temperature(value, type: .celsius).convert(to: temperature.type).value
        
    }
}

extension Temperature {
    
    public func wetBulb(humidity: RelativeHumidity) -> WetBulb {
        return WetBulb(temperature: self, humidity: humidity)
    }
}
