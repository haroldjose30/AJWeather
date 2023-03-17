//
//  WeatherCoreDataEntity+updateFrom.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension WeatherCoreDataEntity {
    
    func updateFrom(_ entity: WeatherEntity) {
        self.id = entity.id
        self.weatherId = entity.weatherId
        self.fkForecastDetailId = entity.fkForecastDetailId
        self.main = entity.main
        self.desc = entity.description
        self.icon = entity.icon
    }
}

