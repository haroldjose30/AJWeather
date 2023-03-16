//
//  CityLocalDataSource.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

class CityLocalDataSource: GenericCoreDataSource<CityCoreDataEntity,CityEntity> {
    
    init() {
        super.init(
            mapToEntity: { $0.mapToCityEntity() },
            updateCoreDataEntity: { $0.updateFrom($1) }
        )
    }
}
