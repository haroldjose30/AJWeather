//
//  ForecastDTO+fixture.swift
//  AJDomainTests
//
//  Created by Jose Harold on 15/03/2023.
//

import AJData

extension ForecastDTO {
    
    static func fixture(
        cod: String = "",
        message: Int = 0,
        cnt: Int = 0,
        list: [ForecastDetailDTO] = [],
        city: CityDTO = CityDTO.fixture()
    ) -> ForecastDTO {
        
        ForecastDTO(
            cod: cod,
            message: message,
            cnt: cnt,
            list: list,
            city: city
        )
    }
}

extension ForecastDTO.CityDTO {
    
    static func fixture(
        id: Int = 0,
        name: String = "",
        coord: ForecastDTO.CoordinateDTO = .fixture(),
        country: String = ""
    ) -> ForecastDTO.CityDTO {
        
        ForecastDTO.CityDTO(
            id: id,
            name: name,
            coord: coord,
            country: country
        )
    }
}

extension ForecastDTO.CoordinateDTO {
    
    static func fixture(
        lat: Double = 0,
        lon: Double = 0
    ) -> ForecastDTO.CoordinateDTO {
        
        ForecastDTO.CoordinateDTO(
            lat: lat,
            lon: lon
        )
    }
}

extension ForecastDTO.ForecastDetailDTO {
    
    static func fixture(
        dt: Int = 0,
        main: ForecastDTO.TemperatureDetailDTO = .fixture(),
        weather: [ForecastDTO.WeatherDTO] = [],
        dtTxt: String = ""
    ) -> ForecastDTO.ForecastDetailDTO {
        
        ForecastDTO.ForecastDetailDTO(
            dt: dt,
            main: main,
            weather: weather,
            dtTxt: dtTxt
        )
    }
}

extension ForecastDTO.TemperatureDetailDTO {
    
    static func fixture(
        temp: Double = 0,
        feelsLike: Double = 0,
        tempMin: Double = 0,
        tempMax: Double = 0,
        humidity: Int = 0
    ) -> ForecastDTO.TemperatureDetailDTO {
        
        ForecastDTO.TemperatureDetailDTO(
            temp: temp,
            feelsLike: feelsLike,
            tempMin: tempMin,
            tempMax: tempMax,
            humidity: humidity
        )
    }
}

extension ForecastDTO.WeatherDTO {
    
    static func fixture(
        id: Int = 0,
        main: String = "",
        description: String = "",
        icon: String = ""
    ) -> ForecastDTO.WeatherDTO {
        
        ForecastDTO.WeatherDTO(
            id: id,
            main: main,
            description: description,
            icon: icon
        )
    }
}
