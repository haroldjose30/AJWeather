//
//  WeatherResponse.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

struct WeatherResponse: Codable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }
}
