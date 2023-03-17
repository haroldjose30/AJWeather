//
//  DataBaseManagerType.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

public protocol DataBaseManagerType {
    
    func initialize()
    func saveContext(
        forceSave: Bool?
    )
    func rollback()
    func dispose()
}
