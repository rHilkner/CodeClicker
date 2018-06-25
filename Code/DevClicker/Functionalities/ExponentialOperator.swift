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
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
func ^^ (radix: Int, power: Double) -> Double {
    return pow(Double(radix), power)
}
func ^^ (radix: Double, power: Int) -> Double {
    return pow(radix, Double(power))
}
func ^^ (radix: Double, power: Double) -> Double {
    return pow(radix, power)
}
