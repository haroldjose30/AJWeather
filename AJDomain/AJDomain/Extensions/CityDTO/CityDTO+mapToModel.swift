//
//  CityDTO+mapToModel.swift
//  AJDomain
//
//  Created by Jose Harold on 17/03/2023.
//
import AJData

extension CityDTO {
    
    func mapToModel() -> CityModel {
        
        CityModel(
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
