//
//  WeatherLocalDataSource.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

import CoreData

class WeatherLocalDataSource: GenericCoreDataSource<WeatherCoreDataEntity,WeatherEntity>  {
    
    init() {
        super.init(
            mapToEntity: { $0.mapToEntity() },
            updateCoreDataEntity: { $0.updateFrom($1) }
        )
    }
    
    func getAllBy(
        fkForecastDetailId: String
    ) async throws -> [WeatherEntity] {
        
        let filter = NSPredicate(format: "fkForecastDetailId = %@", fkForecastDetailId)
        let coreDataEntities = try fetchAllBy(filter: filter)
        return coreDataEntities.map({ $0.mapToEntity() })
    }
}

