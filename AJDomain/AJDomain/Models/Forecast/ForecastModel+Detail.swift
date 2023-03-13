//
//  Detail.swift
//  AJDomain
//
//  Created by Jose Harold on 12/03/2023.
//

public extension ForecastModel {
    
    struct Detail {
        
        public let date: Date
        /// Time of data forecasted, ISO, UTC
        public let dateTxt: String
        public let main: ForecastModel.TemperatureDetail
        public let weather: [WeatherModel]
        
        public init(
            date: Date,
            dateTxt: String,
            main: ForecastModel.TemperatureDetail,
            weather: [WeatherModel]
        ) {
            self.date = date
            self.dateTxt = dateTxt
            self.main = main
            self.weather = weather
        }
    }
}
