//
//  CityCoreDataEntity+mapToCityEntity.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension CityCoreDataEntity {
    
    func mapToCityEntity() -> CityEntity {
        CityEntity(
            id: self.id.toInt(),
            name: self.name ?? "",
            latitude: self.latitude,
            longitude: self.longitude,
            country: self.country ?? ""
        )
    }
}
