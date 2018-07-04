//
//  ExponentialOperator.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

precedencegroup ExponentiativePrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator ^^: ExponentiativePrecedence
func ^^ (radix: DoubleConvertible, power: DoubleConvertible) -> Int {
    return Int(pow(radix.toDouble(), power.toDouble()))
}

infix operator *: MultiplicationPrecedence
func * (lhs: DoubleConvertible, rhs: DoubleConvertible) -> Double {
    return Double(lhs.toDouble() * rhs.toDouble())
}

protocol DoubleConvertible {
    func toDouble() -> Double
}

extension Int: DoubleConvertible {
    func toDouble() -> Double {
        return Double(self)
    }
}

extension Float: DoubleConvertible {
    func toDouble() -> Double {
        return Double(self)
    }
}

extension Double: DoubleConvertible {
    func toDouble() -> Double {
        return self
    }
}
