//
//  ForecastDTO+mapToForecastModel.swift
//  AJDomain
//
//  Created by Jose Harold on 15/03/2023.
//

import AJData

extension ForecastDTO {
    
    func mapToForecastModel() -> ForecastModel {
        
        ForecastModel(
            city: CityModel(
                id: self.city.id,
                name: self.city.name,
                coord: CoordinateModel(
                    latitude: self.city.coord.latitude,
                    longitude: self.city.coord.longitude
                ),
                country: self.city.country
            ),
            list: self.list.map({ forecastDetailDTO in
                ForecastModel.ForecastDetailModel(
                    date: forecastDetailDTO.dt,
                    dateTxt: forecastDetailDTO.dtTxt,
                    main: ForecastModel.TemperatureDetailModel(
                        temp: forecastDetailDTO.main.temp,
                        feelsLike: forecastDetailDTO.main.feelsLike,
                        tempMin: forecastDetailDTO.main.tempMin,
                        tempMax: forecastDetailDTO.main.tempMax,
                        humidity: forecastDetailDTO.main.humidity
                    ),
                    weather: forecastDetailDTO.weather.map({ weatherDTO in
                        WeatherModel(
                            id: weatherDTO.id,
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
