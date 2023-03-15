//
//  TemperatureDetail.swift
//  AJDomain
//
//  Created by Jose Harold on 12/03/2023.
//

public extension ForecastModel {
    
    struct TemperatureDetailModel {
        
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
}
