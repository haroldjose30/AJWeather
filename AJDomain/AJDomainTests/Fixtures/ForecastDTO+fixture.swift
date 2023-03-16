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

extension CityDTO {
    
    static func fixture(
        id: Int = 0,
        name: String = "",
        coord: CoordinateDTO = .fixture(),
        country: String = ""
    ) -> CityDTO {
        
        CityDTO(
            id: id,
            name: name,
            coord: coord,
            country: country
        )
    }
}

extension CoordinateDTO {
    
    static func fixture(
        latitude: Float = 0,
        longitude: Float = 0
    ) -> CoordinateDTO {
        
        CoordinateDTO(
            latitude: latitude,
            longitude: longitude
        )
    }
}

extension ForecastDetailDTO {
    
    static func fixture(
        dt: Int = 0,
        main: TemperatureDetailDTO = .fixture(),
        weather: [WeatherDTO] = [],
        dtTxt: String = ""
    ) -> ForecastDetailDTO {
        
        ForecastDetailDTO(
            dt: dt,
            main: main,
            weather: weather,
            dtTxt: dtTxt
        )
    }
}

extension TemperatureDetailDTO {
    
    static func fixture(
        temp: Float = 0,
        feelsLike: Float = 0,
        tempMin: Float = 0,
        tempMax: Float = 0,
        humidity: Int = 0
    ) -> TemperatureDetailDTO {
        
        TemperatureDetailDTO(
            temp: temp,
            feelsLike: feelsLike,
            tempMin: tempMin,
            tempMax: tempMax,
            humidity: humidity
        )
    }
}

extension WeatherDTO {
    
    static func fixture(
        id: Int = 0,
        main: String = "",
        description: String = "",
        icon: String = ""
    ) -> WeatherDTO {
        
        WeatherDTO(
            id: id,
            main: main,
            description: description,
            icon: icon
        )
    }
}
