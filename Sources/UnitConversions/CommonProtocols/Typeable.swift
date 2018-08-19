//
//  Typeable.swift
//  UnitConversions
//
//  Created by Michael Housh on 10/4/17.
//

public protocol Typeable {
    
    associatedtype UnitType: Equatable, Symbolic
    
    var type: UnitType { get }
}
