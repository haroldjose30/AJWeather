//
//  ForecastDTO+mapToModel.swift
//  AJDomain
//
//  Created by Jose Harold on 15/03/2023.
//

import AJData

extension ForecastDTO {
    
    func mapToModel() -> ForecastModel {
        
        ForecastModel(
            city: CityModel(
                id: self.city.id,
                name: self.city.name,
                latitude: self.city.latitude,
                longitude: self.city.longitude,
                country: self.city.country
            ),
            list: self.list.map({ forecastDetailDTO in
                ForecastDetailModel(
                    date: forecastDetailDTO.date,
                    temperature: forecastDetailDTO.temperature,
                    feelsLike: forecastDetailDTO.feelsLike,
                    temperatureMin: forecastDetailDTO.temperatureMin,
                    temperatureMax: forecastDetailDTO.temperatureMax,
                    humidity: forecastDetailDTO.humidity,
                    weather: forecastDetailDTO.weather.map({ weatherDTO in
                        WeatherModel(
                            id: weatherDTO.id,
                            weatherId: weatherDTO.weatherId,
                            main: weatherDTO.main,
                            description: weatherDTO.description,
                            icon: weatherDTO.icon
                        )
                    })
                )
            })
        )
    }
    
}
