//
//  CityDTO+mapToEntity.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension CityDTO {
    
    func mapToEntity() -> CityEntity {
        
        CityEntity(
            id: self.id,
            name: self.name,
            latitude: self.latitude,
            longitude: self.longitude,
            country: self.country,
            population: self.population,
            sunrise: self.sunrise,
            sunset: self.sunset
        )
    }
}

