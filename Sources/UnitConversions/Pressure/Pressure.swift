//
//  Pressure.swift
//  UnitConversions
//
//  Created by Michael Housh on 10/4/17.
//

import Foundation

public struct Pressure {
    
    let value: Double
    let type: PressureType
    
    init(_ value: Double, type: PressureType = .psi) {
        self.value = value
        self.type = type
    }
}

// MARK: TypeConvertible
extension Pressure: TypeConvertible {
    
    typealias UnitType = PressureType
    
    private func convertToAtmosphere() -> Double {
        switch type {
        case .psi:
            return value * 0.068045957064302
        case .pascals:
            return value * 9.8692316931427e-6
        case .inchesWaterColumn:
            return value * 0.00245832
        case .bar:
            return value * 0.98692316931427
        case .torr:
            return value * 0.0013157893594089
        default: // we're already atmosphere pressure
            return value
        }
    }
    
    public func convert(to pressureType: PressureType) -> Pressure {
        let value: Double
        
        switch pressureType {
        case .atmosphere:
            value = convertToAtmosphere()
        case .psi:
            value = convertToAtmosphere() / 0.068045957064302
        case .pascals:
            value = convertToAtmosphere() / 9.8692316931427e-6
        case .inchesWaterColumn:
            value = convertToAtmosphere() / 0.00245832
        case .torr:
            value = convertToAtmosphere() / 0.0013157893594089
        case .bar:
            value = convertToAtmosphere() / 0.98692316931427
        }
        
        return Pressure(value, type: pressureType)
    }
}

// MARK: Pressure for altitude
extension Pressure {
    
    // There are some inaccuricies due to rounding and conversions between
    // different measurements to come up with the value for the pressure
    // however it is pretty close.
    
    public static func forAltitude(altitude: Length, type pressureType: PressureType = .psi) -> Pressure {
        let meters = altitude.convert(to: .meters).value
        let pressureInPascals = 101325 * pow((1 - 2.25577e-5 * meters), 5.525588)
        return Pressure(pressureInPascals, type: .pascals).convert(to: pressureType)
    }
    
    // convenience to get pressure for altitude at `feet` as `psi`
    //
    // The input (Double) is always used as `feet`.
    //
    // Example get the pressure for altitude in psi at 1000 feet:
    //      Pressure.forAltitude(1000.0)
    //      Pressure.forAltitude(1000.0, .pascals)  // 1000 feet in pascals (Pa)
    public static func forAltitude(_ feet: Double, _ pressureType: PressureType = .psi) -> Pressure {
        let altitude = Length(feet, type: .feet)
        return Pressure.forAltitude(altitude: altitude, type: pressureType)
    }
}
