//
//  Symbolic.swift
//  UnitConversionsPackageDescription
//
//  Created by Michael Housh on 10/4/17.
//

protocol Symbolic {
    /* Objects that implement this protocol have a `symbol` attribute
       That is a `String`.
     */
    var symbol: String { get }
}
