//
//  ForecastDetailResponseDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

struct ForecastDetailResponseDTO: Codable {
    
    let dt: Int
    let main: TemperatureDetailResponseDTO
    let weather: [WeatherResponseDTO]
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
        case dtTxt = "dt_txt"
    }
}
