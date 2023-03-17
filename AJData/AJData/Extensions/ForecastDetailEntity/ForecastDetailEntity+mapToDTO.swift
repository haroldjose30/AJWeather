//
//  ForecastDetailEntity+mapToDTO.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension ForecastDetailEntity {
    
    func mapToDTO(
        weathers: [WeatherDTO]
    ) -> ForecastDetailDTO {
        
        ForecastDetailDTO(
            date: self.dt,
            temperature: self.temp,
            feelsLike: self.feelsLike,
            temperatureMin: self.tempMin,
            temperatureMax: self.tempMax,
            humidity: self.humidity,
            weather: weathers
        )
    }
}
