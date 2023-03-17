//
//  CityResponse.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

struct CityResponse: Codable {
    
    let id: Int
    let name: String
    let coord: CoordinateResponse
    let country: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coord
        case country
    }
}