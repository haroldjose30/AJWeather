//
//  CityLocalDataSource.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

import CoreData
import Combine

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
        let filter = NSPredicate(
            format: "latitude >= %f AND latitude =< %f AND longitude >= %f AND longitude =< %f",
            latitude - floatAdjust,
            latitude + floatAdjust,
            longitude - floatAdjust,
            longitude + floatAdjust
        )
        
        guard let coreDataEntity = try fetchBy(filter: filter) else {
            return nil
        }
        return mapToEntity(coreDataEntity)
        
    }
    
    func getAllRx() -> AnyPublisher<[CityEntity], Error> {
        
        let cityEntities = try? fetchAll().map({ $0.mapToEntity() })
        
        return Just(cityEntities ?? [])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
}
