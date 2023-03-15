//
//  ForecastDetailModel.swift
//  AJDomain
//
//  Created by Jose Harold on 12/03/2023.
//

public extension ForecastModel {
    
    struct ForecastDetailModel {
        
        public let date: Double
        public let dateTxt: String
        public let main: TemperatureDetailModel
        public let weather: [WeatherModel]
        
        public init(
            date: Double,
            dateTxt: String,
            main: TemperatureDetailModel,
            weather: [WeatherModel]
        ) {
            self.date = date
            self.dateTxt = dateTxt
            self.main = main
            self.weather = weather
        }
    }
}
