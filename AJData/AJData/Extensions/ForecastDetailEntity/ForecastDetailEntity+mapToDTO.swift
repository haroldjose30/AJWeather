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
            dt: self.dt,
            main: TemperatureDetailDTO(
                temp: self.temp,
                feelsLike: self.feelsLike,
                tempMin: self.tempMin,
                tempMax: self.tempMax,
                humidity: self.humidity
            ),
            weather: weathers,
            dtTxt: self.dtTxt
        )
    }
}
