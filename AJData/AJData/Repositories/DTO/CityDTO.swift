//
//  CityDTO.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

public struct CityDTO {
    
    public let id: String
    public let name: String
    public let latitude: Float
    public let longitude: Float
    public let country: String
    
    public init(
        id: String,
        name: String,
        latitude: Float,
        longitude: Float,
        country: String
    ) {
        
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.country = country
    }
}
