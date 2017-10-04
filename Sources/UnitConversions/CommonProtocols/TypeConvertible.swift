//
//  Convertible.swift
//  UnitConversionsPackageDescription
//
//  Created by Michael Housh on 10/4/17.
//


protocol TypeConvertible: Valuable, Equatable, CustomStringConvertible, Typeable {
    /* Objects that implement this protocol must provide a `convert` function that
       will return a new instance as the converted type.
     
       They also must implement the `Typeable` and `Valuable` protocols.
       And get a default implementation of the `Equatable` and `CustomStringConvertible`
       protocols.
     
     */
    func convert(to: UnitType) -> Self
}

// MARK: Equatable
//
// Allows all objects that conform to the protocol be
// equatable.
// Objects are considered equal when their value and
// type match.
extension TypeConvertible {
    
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.type == rhs.type && lhs.value == rhs.value
    }
    
}

// MARK: CustomStringConvertible
extension TypeConvertible {
    
    public var description: String {
        return "\(value) \(type.symbol)"
    }
}
