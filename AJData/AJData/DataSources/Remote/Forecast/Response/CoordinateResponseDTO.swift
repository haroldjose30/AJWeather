//
//  CoordinateResponseDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

struct CoordinateResponseDTO: Codable {
    
    let lat: Double
    let lon: Double
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lon
    }
}
