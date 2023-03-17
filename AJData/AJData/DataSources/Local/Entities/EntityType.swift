//
//  EntityType.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

protocol EntityType: Identifiable, Equatable {
    
    var id: String { get }
}

// MARK: - Equatable

extension EntityType {
    
    static func == (lhs: any EntityType, rhs: any EntityType) -> Bool {
        lhs.id == rhs.id
    }
}
