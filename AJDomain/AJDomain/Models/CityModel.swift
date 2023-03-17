//
//  CityModel.swift
//  AJDomain
//
//  Created by Jose Harold on 12/03/2023.
//

public struct CityModel {
    
    public let id: String
    public let name: String
    public let coord: CoordinateModel
    public let country: String
    
    public init(
        id: String,
        name: String,
        coord: CoordinateModel,
        country: String
    ) {
        
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
    }
}
