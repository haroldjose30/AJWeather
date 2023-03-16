//
//  ForecastDetailDTO.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

public struct ForecastDetailDTO {
    
    public let dt: Int
    public let main: TemperatureDetailDTO
    public let weather: [WeatherDTO]
    public let dtTxt: String
    
    public init(
        dt: Int,
        main: TemperatureDetailDTO,
        weather: [WeatherDTO],
        dtTxt: String
    ) {
        self.dt = dt
        self.main = main
        self.weather = weather
        self.dtTxt = dtTxt
    }
}
