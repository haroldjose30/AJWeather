//
//  ForecastResponseDTO+toForecastDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

extension ForecastResponseDTO {
    
    func maptoForecastDTO() -> ForecastDTO {
        
        ForecastDTO(
            cod: self.cod,
            message: self.message,
            cnt: self.cnt,
            list: self.list.map({ forecastDetailResponseDTO in
                ForecastDTO.ForecastDetailDTO(
                    dt: forecastDetailResponseDTO.dt,
                    main: ForecastDTO.TemperatureDetailDTO(
                        temp: forecastDetailResponseDTO.main.temp,
                        feelsLike: forecastDetailResponseDTO.main.feelsLike,
                        tempMin: forecastDetailResponseDTO.main.tempMin,
                        tempMax: forecastDetailResponseDTO.main.tempMax,
                        humidity: forecastDetailResponseDTO.main.humidity
                    ),
                    weather: forecastDetailResponseDTO.weather.map({ weatherResponseDTO in
                        ForecastDTO.WeatherDTO(
                            id: weatherResponseDTO.id,
                            main: weatherResponseDTO.main,
                            description: weatherResponseDTO.description,
                            icon: weatherResponseDTO.icon
                        )
                    }),
                    dtTxt: forecastDetailResponseDTO.dtTxt
                )
            }),
            city: ForecastDTO.CityDTO(
                id: self.city.id,
                name: self.city.name,
                coord: ForecastDTO.CoordinateDTO(
                    lat: self.city.coord.lat,
                    lon: self.city.coord.lon
                ),
                country: self.city.country
            )
        )
        
    }
}
