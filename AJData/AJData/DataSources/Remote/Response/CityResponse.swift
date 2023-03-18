//
//  CityResponse.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

struct CityResponse: Codable {
    
    var id: Int
    var name: String
    var coord: CoordinateResponse
    var country: String
    var population: Int
    var sunrise: Int
    var sunset: Int
    var sys: Sys?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coord
        case country
        case population
        case sunrise
        case sunset
        case sys
    }
}

extension CityResponse {
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        coord = (try? values.decode(CoordinateResponse.self, forKey: .coord)) ?? CoordinateResponse(lat: 0, lon: 0)
        country = (try? values.decode(String.self, forKey: .country)) ?? ""
        population = (try? values.decode(Int.self, forKey: .population)) ?? 0
        sunrise = (try? values.decode(Int.self, forKey: .sunrise)) ?? 0
        sunset = (try? values.decode(Int.self, forKey: .sunset)) ?? 0
        sys = try? values.decode(Sys.self, forKey: .sys)
        if let sys {
            country = sys.country
            sunrise = sys.sunrise
            sunset = sys.sunset
        }
    }
}



extension CityResponse {
    
    struct Sys: Codable {
        let type: Int
        let id: Int
        let country: String
        let sunrise: Int
        let sunset: Int
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case id = "id"
            case country = "country"
            case sunrise = "sunrise"
            case sunset = "sunset"
        }
    }
   
}
