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
            mapToEntity: { $0.mapToEntity() },
            updateCoreDataEntity: { $0.updateFrom($1) }
        )
    }
    
    func getBy(
        latitude: Float,
        longitude: Float
    ) async throws -> CityEntity? {
        
        //Todo: workaround to work with floats using latitude and longitude
        let floatAdjust: Float = 0.000009;
        let filter = NSPredicate(format: "latitude >= %f AND latitude =< %f AND longitude >= %f AND longitude =< %f", latitude - floatAdjust,  latitude + floatAdjust, longitude - floatAdjust, longitude + floatAdjust)
        //let filter = NSPredicate(format: "id = %@", String(2742611))
        guard let coreDataEntity = try fetchBy(filter: filter) else {
            return nil
        }
        return mapToEntity(coreDataEntity)
        
    }
    
}
