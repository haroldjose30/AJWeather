//
//  CityModel.swift
//  AJDomain
//
//  Created by Jose Harold on 12/03/2023.
//

public struct CityModel {
    
    public let id: String
    public let name: String
    public let latitude: Float
    public let longitude: Float
    public let country: String
    public let population: Int
    public let sunrise: Int
    public let sunset: Int
    
    public init(
        id: String,
        name: String,
        latitude: Float,
        longitude: Float,
        country: String,
        population: Int,
        sunrise: Int,
        sunset: Int
    ) {
        
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.country = country
        self.population = population
        self.sunrise = sunrise
        self.sunset = sunset
    }
}
