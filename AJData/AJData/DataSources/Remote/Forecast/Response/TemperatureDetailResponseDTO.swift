//
//  TemperatureDetailResponseDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

struct TemperatureDetailResponseDTO: Codable {
    
    let temp: Float
    let feelsLike: Float
    let tempMin: Float
    let tempMax: Float
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}
