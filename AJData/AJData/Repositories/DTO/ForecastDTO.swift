//
//  ForecastDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import Foundation

// MARK: - ForecastDTO

public struct ForecastDTO: Codable {
    
    public let cod: String
    public let message: Int
    public let cnt: Int
    public let list: [ForecastDetailDTO]
    public let city: CityDTO
    
    public init(
        cod: String,
        message: Int,
        cnt: Int,
        list: [ForecastDTO.ForecastDetailDTO],
        city: ForecastDTO.CityDTO
    ) {
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.list = list
        self.city = city
    }
    
    // MARK: - CityDTO
    
    public struct CityDTO: Codable {
        
        public let id: Int
        public let name: String
        public let coord: CoordinateDTO
        public let country: String
        
        public init(
            id: Int,
            name: String,
            coord: ForecastDTO.CoordinateDTO,
            country: String
        ) {
            
            self.id = id
            self.name = name
            self.coord = coord
            self.country = country
        }
    }
    
    // MARK: - CoordinateDTO
    
    public struct CoordinateDTO: Codable {
        
        
        public let lat: Double
        public let lon: Double
        
        public init(
            lat: Double,
            lon: Double
        ) {
            self.lat = lat
            self.lon = lon
        }
    }
    
    // MARK: - ForecastDetailDTO
    
    public struct ForecastDetailDTO: Codable {
        
        public let dt: Double
        public let main: TemperatureDetailDTO
        public let weather: [WeatherDTO]
        public let dtTxt: String
        
        public init(
            dt: Double,
            main: ForecastDTO.TemperatureDetailDTO,
            weather: [ForecastDTO.WeatherDTO],
            dtTxt: String
        ) {
            self.dt = dt
            self.main = main
            self.weather = weather
            self.dtTxt = dtTxt
        }
    }
    
    // MARK: - TemperatureDetailDTO
    
    public struct TemperatureDetailDTO: Codable {
        
        public let temp: Double
        public let feelsLike: Double
        public let tempMin: Double
        public let tempMax: Double
        public let humidity: Int
        
        public init(
            temp: Double,
            feelsLike: Double,
            tempMin: Double,
            tempMax: Double,
            humidity: Int
        ) {
            self.temp = temp
            self.feelsLike = feelsLike
            self.tempMin = tempMin
            self.tempMax = tempMax
            self.humidity = humidity
        }
    }
    
    // MARK: - WeatherDTO
    
    public struct WeatherDTO: Codable {
        
        public let id: Int
        public let main: String
        public let description: String
        public let icon: String
        
        public init(
            id: Int,
            main: String,
            description: String,
            icon: String
        ) {
            self.id = id
            self.main = main
            self.description = description
            self.icon = icon
        }
    }
}
