//
//  ForecastDTO+fixture.swift
//  AJDomainTests
//
//  Created by Jose Harold on 15/03/2023.
//

import AJData

extension ForecastDTO {
    
    static func fixture(
        city: CityDTO = CityDTO.fixture(),
        list: [ForecastDetailDTO] = []
    ) -> ForecastDTO {
        
        ForecastDTO(
            city: city,
            list: list
        )
    }
}

extension CityDTO {
    
    static func fixture(
        id: String = "",
        name: String = "",
        latitude: Float = 0,
        longitude: Float = 0,
        country: String = "",
        population: Int = 0,
        sunrise: Int = 0,
        sunset: Int = 0
    ) -> CityDTO {
        
        CityDTO(
            id: id,
            name: name,
            latitude: latitude,
            longitude: longitude,
            country: country,
            population: population,
            sunrise: sunrise,
            sunset: sunset
        )
    }
}

extension ForecastDetailDTO {
    
    static func fixture(
        date: Int = 0,
        temperature: Float = 0,
        feelsLike: Float = 0,
        temperatureMin: Float = 0,
        temperatureMax: Float = 0,
        humidity: Int = 0,
        weather: [WeatherDTO] = []
    ) -> ForecastDetailDTO {
        
        ForecastDetailDTO(
            date: date,
            temperature: temperature,
            feelsLike: feelsLike,
            temperatureMin: temperatureMin,
            temperatureMax: temperatureMax,
            humidity: humidity,
            weather: weather
        )
    }
}

extension WeatherDTO {
    
    static func fixture(
        id: String = "",
        weatherId: String = "",
        main: String = "",
        description: String = "",
        icon: String = ""
    ) -> WeatherDTO {
        
        WeatherDTO(
            id: id,
            weatherId: weatherId,
            main: main,
            desc: description,
            icon: icon
        )
    }
}
