//
//  ForecastDetailResponse+mapToDTO.swift
//  AJData
//
//  Created by Jose Harold on 17/03/2023.
//

extension ForecastDetailResponse {
    
    func mapToDTO() -> ForecastDetailDTO {
        
        ForecastDetailDTO(
            date: self.dt,
            temperature: self.main.temp,
            feelsLike: self.main.feelsLike,
            temperatureMin: self.main.tempMin,
            temperatureMax: self.main.tempMax,
            humidity: self.main.humidity,
            weather: self.weather.map{ $0.mapToDTO() }
        )
    }
}
