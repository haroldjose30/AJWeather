//
//  File.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension CityDTO {
    
    func mapToCityEntity() -> CityEntity {
        
        CityEntity(
            id: self.id,
            name: self.name,
            latitude: self.coord.latitude,
            longitude: self.coord.longitude,
            country: self.country
        )
    }
}

