//
//  ForecastDetailDTO.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

public struct ForecastDetailDTO {
    
    public let date: Int
    public let temperature: Float
    public let feelsLike: Float
    public let temperatureMin: Float
    public let temperatureMax: Float
    public let humidity: Int
    public let weather: [WeatherDTO]
    
    public init(
        date: Int,
        temperature: Float,
        feelsLike: Float,
        temperatureMin: Float,
        temperatureMax: Float,
        humidity: Int,
        weather: [WeatherDTO]
    ) {
        
        self.date = date
        self.temperature = temperature
        self.feelsLike = feelsLike
        self.temperatureMin = temperatureMin
        self.temperatureMax = temperatureMax
        self.humidity = humidity
        self.weather = weather
    }
}
