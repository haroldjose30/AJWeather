//
//  CityModel.swift
//  AJDomain
//
//  Created by Jose Harold on 12/03/2023.
//

public struct CityModel {
    
    public let id: Int
    public let name: String
    public let coord: CoordinateModel
    public let country: String
    
    public init(
        id: Int,
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
