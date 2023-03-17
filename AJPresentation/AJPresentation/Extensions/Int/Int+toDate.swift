//
//  Int+toDate.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

extension Int {
    
    func toDate() -> Date {
        Date(timeIntervalSince1970: Double(self))
    }
}
