//
//  PressureType.swift
//  UnitConversions
//
//  Created by Michael Housh on 10/4/17.
//

public enum PressureType: Symbolic {
    case psi, atmosphere, pascals, inchesWaterColumn, bar, torr
    
    public var symbol: String {
        switch self {
        case .psi:
            return "psi"
        case .atmosphere:
            return "atm"
        case .pascals:
            return "Pa"
        case .inchesWaterColumn:
            return "inH2O"
        case .bar:
            return "bar"
        case .torr:
            return "Torr"
        }
    }
}
