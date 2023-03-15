//
//  ForecastResponseDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import Foundation

// MARK: - ForecastResponseDTO

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
    
    
    // MARK: - CityResponseDTO
    
    struct CityResponseDTO: Codable {
        
        let id: Int
        let name: String
        let coord: CoordinateResponseDTO
        let country: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case coord
            case country
        }
    }
    
    // MARK: - CoordinateResponseDTO
    
    struct CoordinateResponseDTO: Codable {
        
        let lat: Double
        let lon: Double
        
        enum CodingKeys: String, CodingKey {
            case lat
            case lon
        }
    }
    
    // MARK: - ForecastDetailDTO
    
    struct ForecastDetailResponseDTO: Codable {
        
        let dt: Double
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
    
    // MARK: - TemperatureDetailResponseDTO
    
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
    
    // MARK: - WeatherResponseDTO
    
    struct WeatherResponseDTO: Codable {
        
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
}


