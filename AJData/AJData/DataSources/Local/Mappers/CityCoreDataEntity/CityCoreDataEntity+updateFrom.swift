//
//  CityCoreDataEntity+updateFrom.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension CityCoreDataEntity {
    
    func updateFrom(_ entity: CityEntity) {
        
        self.id = entity.id.toInt32()
        self.name = entity.name
        self.latitude = entity.latitude
        self.longitude = entity.longitude
        self.country = entity.country
    }
}
