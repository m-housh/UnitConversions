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
    
    init(percent: Double) {
        self.value = percent / 100
    }
    
    init(decimal: Double) {
        self.value = decimal
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
