//
//  ForecastResponseDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

struct ForecastResponseDTO: Codable {
    
    let cod: String
    let message: Int
    let cnt: Int
    let list: [ForecastDetailResponseDTO]
    let city: CityResponseDTO
    
    enum CodingKeys: String, CodingKey {
        case cod
        case message
        case cnt
        case list
        case city
    }
}


