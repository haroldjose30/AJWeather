//
//  WeatherCoreDataEntity+mapToEntity.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension WeatherCoreDataEntity {
    
    func mapToEntity() -> WeatherEntity {
        
        WeatherEntity(
            weatherId: self.weatherId ?? "",
            fkForecastDetailId: self.fkForecastDetailId ?? "",
            main: self.main ?? "",
            desc: self.desc ?? "",
            icon: self.icon ?? ""
        )
    }
}

