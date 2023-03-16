//
//  TemperatureDetail.swift
//  AJDomain
//
//  Created by Jose Harold on 12/03/2023.
//

public extension ForecastModel {
    
    struct TemperatureDetailModel {
        
        public let temp: Float
        public let feelsLike: Float
        public let tempMin: Float
        public let tempMax: Float
        public let humidity: Int
        
        public init(
            temp: Float,
            feelsLike: Float,
            tempMin: Float,
            tempMax: Float,
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
