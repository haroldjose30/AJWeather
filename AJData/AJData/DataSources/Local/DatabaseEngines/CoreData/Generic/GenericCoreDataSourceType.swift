//
//  GenericLocalDataSourceType.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import CoreData

protocol GenericCoreDataSourceType {
    associatedtype CoreDataEntity:NSFetchRequestResult & NSManagedObject
    associatedtype Entity: EntityType
    
    func create(
        entity: Entity
    ) async throws
    
    func update(
        entity: Entity
    ) async throws
    
    func getAll() async throws -> [Entity]
    
    func getById(
        _ id: String
    ) async throws -> Entity?
    
    func delete(
        _ id: String
    ) async throws
    
    func setAutomaticSaveContext(
        _ isAutoSave: Bool
    )
}
