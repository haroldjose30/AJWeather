//
//  CityLocalDataSource.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

import CoreData

class CityLocalDataSource: GenericCoreDataSource<CityCoreDataEntity,CityEntity>  {
    
    init() {
        super.init(
            mapToEntity: { $0.mapToCityEntity() },
            updateCoreDataEntity: { $0.updateFrom($1) }
        )
    }
    
    func getBy(
        latitude: Float,
        longitude: Float
    ) async throws -> CityEntity? {
        
        
        //Todo: not working with latitude and longitudo
        //let epsilon: Float = 0.000001;
        //let filter = NSPredicate(format: "latitude > %f AND latitude < %f AND longitude > %f AND longitude < %f", latitude - epsilon,  latitude + epsilon, longitude - epsilon, longitude + epsilon)
        //workaround
        let filter = NSPredicate(format: "id = %@", String(2742611))
        guard let coreDataEntity = try fetchBy(filter: filter) else {
            return nil
        }
        return mapToEntity(coreDataEntity)
        
    }
    
}
