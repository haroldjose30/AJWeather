//
//  TemperatureDetailResponseDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

struct TemperatureDetailResponseDTO: Codable {
    
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}
