//
//  ForecastDetailDTO+mapToEntity.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension ForecastDetailDTO {
    
    func mapToEntity(
        fkCityId: String
    ) -> ForecastDetailEntity {
        
        ForecastDetailEntity(
            fkCityId: fkCityId,
            dt: self.date,
            temp: self.temperature,
            feelsLike: self.feelsLike,
            tempMin: self.temperatureMin,
            tempMax: self.temperatureMax,
            humidity: self.humidity
        )
    }
}
