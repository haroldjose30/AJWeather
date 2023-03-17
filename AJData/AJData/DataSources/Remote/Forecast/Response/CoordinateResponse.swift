//
//  CoordinateResponse.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

struct CoordinateResponse: Codable {
    
    let lat: Float
    let lon: Float
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lon
    }
}
