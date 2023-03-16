//
//  CityResponseDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

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
