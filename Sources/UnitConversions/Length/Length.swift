 //
//  Length.swift
//  UnitConversionsPackageDescription
//
//  Created by Michael Housh on 10/4/17.
//

 public struct Length {
    /* A convertible unit of measure. For a distance of length, feet,
     meters, or centimeters.
     
     */
    
    
    public let type: LengthType
    public let value: Double
    
    public init(_ value: Double, type: LengthType = .inches) {
        self.value = value
        self.type = type
    }
    
    // Allows initialization without labeled parameters.
    public init(_ value: Double, _ type: LengthType = .inches) {
        self.value = value
        self.type = type
    }
 }
 
 
 // MARK: TypeConvertible
 extension Length: TypeConvertible {
    // all conversions take place as inches to whatever
    // type the caller asks for or vice versa
    
    public typealias UnitType = LengthType
    
    private func convertToInches() -> Double {
        // converts the instances current value to inches
        switch type {
        case .feet:
            return value * 12.0
        case .meters:
            return value * 39.370078740157
        case .centimeters:
            return value * 0.39370078740157
        default:  // we're already inches
            return value
        }
    }
    
    public func convert(to lengthType: LengthType) -> Length {
        
        let value: Double  // holds the converted value
        
        // convert the value to inches and then convert
        // to the type the caller asked for
        switch lengthType {
        case .inches:
            value = convertToInches()
        case .feet:
            value = convertToInches() / 12
        case .meters:
            value = convertToInches() / 39.370078740157
        case .centimeters:
            value = convertToInches() / 0.39370078740157
        }
        
        // Return a new instance of `Length` with the
        // converted value and type flag set.
        return Length(value, type: lengthType)
    }
 }
