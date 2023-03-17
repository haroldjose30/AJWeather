//
//  ForecastResponseDTO+toForecastDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

extension ForecastResponseDTO {
    
    func mapToDTO() -> ForecastDTO {
        
        ForecastDTO(
            cod: self.cod,
            message: self.message,
            cnt: self.cnt,
            list: self.list.map({ forecastDetailResponseDTO in
                ForecastDetailDTO(
                    dt: forecastDetailResponseDTO.dt,
                    main: TemperatureDetailDTO(
                        temp: forecastDetailResponseDTO.main.temp,
                        feelsLike: forecastDetailResponseDTO.main.feelsLike,
                        tempMin: forecastDetailResponseDTO.main.tempMin,
                        tempMax: forecastDetailResponseDTO.main.tempMax,
                        humidity: forecastDetailResponseDTO.main.humidity
                    ),
                    weather: forecastDetailResponseDTO.weather.map({ weatherResponseDTO in
                        WeatherDTO(
                            id: String(weatherResponseDTO.id),
                            main: weatherResponseDTO.main,
                            description: weatherResponseDTO.description,
                            icon: weatherResponseDTO.icon
                        )
                    }),
                    dtTxt: forecastDetailResponseDTO.dtTxt
                )
            }),
            city: CityDTO(
                id: String(self.city.id),
                name: self.city.name,
                coord: CoordinateDTO(
                    latitude: self.city.coord.lat,
                    longitude: self.city.coord.lon
                ),
                country: self.city.country
            )
        )
        
    }
}
