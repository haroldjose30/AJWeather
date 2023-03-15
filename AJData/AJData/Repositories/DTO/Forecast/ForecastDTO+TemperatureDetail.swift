//
//  TemperatureDetailDTO.swift
//  AJData
//
//  Created by Jose Harold on 12/03/2023.
//

public extension ForecastDTO {
    
    struct TemperatureDetailDTO {
        
        public let temperature: Double
        public let feelsLike: Double
        public let tempMin: Double
        public let tempMax: Double
        public let humidity: Int
        
        public init(
            temperature: Double,
            feelsLike: Double,
            tempMin: Double,
            tempMax: Double,
            humidity: Int
        ) {
            
            self.temperature = temperature
            self.feelsLike = feelsLike
            self.tempMin = tempMin
            self.tempMax = tempMax
            self.humidity = humidity
        }
    }
}
