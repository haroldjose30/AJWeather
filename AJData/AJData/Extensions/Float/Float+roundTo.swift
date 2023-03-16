//
//  Float+roundTo.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension Float {
    func roundTo(_ places: Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
