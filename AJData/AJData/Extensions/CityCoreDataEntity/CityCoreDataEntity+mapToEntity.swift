//
//  CityCoreDataEntity+mapToCityEntity.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension CityCoreDataEntity {
    
    func mapToEntity() -> CityEntity {
        
        CityEntity(
            id: self.id ?? "",
            name: self.name ?? "",
            latitude: self.latitude,
            longitude: self.longitude,
            country: self.country ?? "",
            population: self.population.toInt(),
            sunrise: self.sunrise.toInt(),
            sunset: self.sunset.toInt()
        )
    }
}
