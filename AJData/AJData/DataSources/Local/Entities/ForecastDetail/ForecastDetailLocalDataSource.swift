//
//  ForecastDetailLocalDataSource.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

import CoreData

class ForecastDetailLocalDataSource: GenericCoreDataSource<ForecastDetailCoreDataEntity,ForecastDetailEntity>  {
    
    init() {
        super.init(
            mapToEntity: { $0.mapToEntity() },
            updateCoreDataEntity: { $0.updateFrom($1) }
        )
    }
    
    func getAllBy(
        cityId: String
    ) async throws -> [ForecastDetailEntity] {
        
        let filter = NSPredicate(format: "fkCityId = %@", cityId)
        let coreDataEntities = try fetchAllBy(filter: filter)
        return coreDataEntities.map({ $0.mapToEntity() })
    }
}

