//
//  AJHttpLogger.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

import Foundation

class AJHttpLogger {
    
    static var enabled: Bool = false
    
    private init() {
#if DEBUG
        AJHttpLogger.enabled = true
#endif
    }
    
    static func print(_ message: String) {
        if AJHttpLogger.enabled {
            Swift.print(message)
        }
    }
}
