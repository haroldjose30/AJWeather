//
//  GenericCoreDataSource.swift.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import CoreData

class GenericCoreDataSource<
    CoreDataEntity: NSFetchRequestResult & NSManagedObject,
    Entity: EntityType
>: GenericCoreDataSourceType {
    
    private let container: NSPersistentContainer
    let mapToEntity:(CoreDataEntity) -> Entity
    let updateCoreDataEntity: (CoreDataEntity,Entity) -> Void
    
    init(
        mapToEntity: @escaping (CoreDataEntity) -> Entity,
        updateCoreDataEntity: @escaping (CoreDataEntity,Entity) -> Void
    ){
        self.container = CoreDataManager.getInstance().container
        self.mapToEntity = mapToEntity
        self.updateCoreDataEntity = updateCoreDataEntity
    }
    
    func create(
        entity: Entity
    ) async throws {
        
        if let coreDataEntity = try fetchBy(id: entity.id) {
            updateCoreDataEntity(coreDataEntity,entity)
            saveContext()
            return
        }
        
        let coreDataEntity = CoreDataEntity(context: container.viewContext)
        updateCoreDataEntity(coreDataEntity,entity)
        saveContext()
    }
    
    func update(
        entity: Entity
    ) async throws {
        
        guard let coreDataEntity = try fetchBy(id: entity.id) else {
            throw GenericCoreDataSourceError.entityNotFound
        }
        updateCoreDataEntity(coreDataEntity,entity)
        saveContext()
    }
    
    func getAll() async throws -> [Entity] {
        
        let coreDataEntities:[CoreDataEntity] = try fetchAll()
        return coreDataEntities.map { mapToEntity($0) }
    }
    
    func getById(
        _ id: String
    ) async throws -> Entity? {
        
        guard let coreDataEntity = try fetchBy(id: id) else {
            return nil
        }
        return mapToEntity(coreDataEntity)
    }
    
    func delete(
        _ id: String
    ) async throws {
        
        guard let coreDataEntity = try fetchBy(id: id) else {
            return
        }
        
        let context = container.viewContext
        context.delete(coreDataEntity)
        saveContext()
        
//        do {
//            try context.save()
//        } catch {
//            context.rollback()
//            print(#function,"Error:",error.localizedDescription)
//        }
    }
    
    func setAutomaticSaveContext(
        _ activate: Bool
    ) {
        CoreDataManager.getInstance().setAutomaticSaveContext(activate)
    }
}

// MARK: - CoreData Auxiliary functions

extension GenericCoreDataSource {
    
    func fetchAll() throws -> [CoreDataEntity] {
        
        try fetchAllBy()
    }
    
    func fetchAllBy(
        filter: NSPredicate? = nil
    ) throws -> [CoreDataEntity] {
        
        let request = NSFetchRequest<CoreDataEntity>(entityName: String(describing: CoreDataEntity.self))
        if let filter {
            request.predicate = filter
        }
        let coreDataEntities = try container.viewContext.fetch(request)
        return coreDataEntities
    }
    
    func fetchBy(
        id: String
    ) throws -> CoreDataEntity? {
        
        let filter = NSPredicate(format: "id = %@", id)
        return try fetchBy(
            filter: filter
        )
    }
    
    func fetchBy(
        filter: NSPredicate
    ) throws -> CoreDataEntity? {
        
        let request = NSFetchRequest<CoreDataEntity>(entityName: String(describing: CoreDataEntity.self))
        request.fetchLimit = 1
        request.predicate = filter
        let coreDataEntity = try container.viewContext.fetch(request).first
        return coreDataEntity
    }
    
    func saveContext(
        forceSave: Bool? = nil
    ){
        CoreDataManager.getInstance().saveContext(forceSave: forceSave)
    }
    
    func rollback(){
        CoreDataManager.getInstance().rollback()
    }
}
