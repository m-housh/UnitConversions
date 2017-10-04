//
//  LengthType.swift
//  UnitConversionsPackageDescription
//
//  Created by Michael Housh on 10/4/17.
//

public enum LengthType: Symbolic {
    /* Represents the units of length and their common symbols.
     
     */
    case inches, feet, meters, centimeters
    
    public var symbol: String {
        switch self {
        case .inches:
            return "in"
        case .feet:
            return "ft"
        case .meters:
            return "m"
        case .centimeters:
            return "cm"
        }
    }
}
