//
//  ForecastDetailResponse.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

struct ForecastDetailResponse: Codable {
    
    let dt: Int
    let main: TemperatureDetailResponse
    let weather: [WeatherResponse]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
    }
}
