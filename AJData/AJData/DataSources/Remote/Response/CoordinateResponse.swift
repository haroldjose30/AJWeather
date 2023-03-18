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

extension CoordinateResponse {
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        lat = (try? values.decode(Float.self, forKey: .lat)) ?? 0
        lon = (try? values.decode(Float.self, forKey: .lon)) ?? 0
    }
}

