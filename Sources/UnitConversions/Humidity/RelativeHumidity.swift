//
//  RelativeHumidity.swift
//  UnitConversions
//
//  Created by Michael Housh on 10/4/17.
//

public struct RelativeHumidity: Valuable, CustomStringConvertible, Equatable {
    /* Container for relative humidity.
 
     */
    
    public let value: Double
    
    public init(percent: Double) {
        self.value = percent / 100
    }
    
    public init(decimal: Double) {
        self.value = decimal
    }
    
    public init(_ value: Double) {
        if value > 1 {
            self.init(percent: value)
        }
        else {
            self.init(decimal: value)
        }
    }
    
    public var description: String {
        // Reutrn string as "50.0 %"
        return "\(value * 100) %"
    }
    
    public static func ==(lhs: RelativeHumidity, rhs: RelativeHumidity) -> Bool {
        // check if the values match.
        return lhs.value == rhs.value
    }
    
}
