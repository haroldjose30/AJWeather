//
//  CityCoreDataEntity+updateFrom.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension CityCoreDataEntity {
    
    func updateFrom(_ entity: CityEntity) {
        
        self.id = entity.id
        self.name = entity.name
        self.latitude = entity.latitude.roundTo(6)
        self.longitude = entity.longitude.roundTo(6)
        self.country = entity.country
        self.population = entity.population.toInt32()
        self.sunrise = entity.sunrise.toInt32()
        self.sunset = entity.sunset.toInt32()
    }
}
