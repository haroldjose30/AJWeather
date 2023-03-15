//
//  AJHttpLogger.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

import Foundation

class AJHttpLogger {
    
    static var enabled: Bool = true
    
    private init() {}
    
    static func print(_ items: Any...) {
        if AJHttpLogger.enabled {
            Swift.print("AJHttpLogger:",items)
        }
    }
}
