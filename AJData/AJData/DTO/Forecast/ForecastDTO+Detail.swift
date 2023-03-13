//
//  Detail.swift
//  AJData
//
//  Created by Jose Harold on 12/03/2023.
//

public extension ForecastDTO {
    
    public struct DetailDTO {
        
        public let date: Date
        /// Time of data forecasted, ISO, UTC
        public let dateTxt: String
        public let main: ForecastDTO.TemperatureDetailDTO
        public let weather: [WeatherDTO]
        
        public init(
            date: Date,
            dateTxt: String,
            main: ForecastDTO.TemperatureDetailDTO,
            weather: [WeatherDTO]
        ) {
            self.date = date
            self.dateTxt = dateTxt
            self.main = main
            self.weather = weather
        }
    }
}
