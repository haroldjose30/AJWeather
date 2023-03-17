//
//  WeatherDTO+mapToEntity.swift.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension WeatherDTO {
    
    func mapToEntity(fkForecastDetailId: String) -> WeatherEntity {
        
        WeatherEntity(
            weatherId: self.id,
            fkForecastDetailId: fkForecastDetailId,
            main: self.main,
            description: self.description,
            icon: self.icon
        )
    }
}
