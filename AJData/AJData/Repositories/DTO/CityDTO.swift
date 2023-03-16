//
//  CityDTO.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

public struct CityDTO {
    
    public let id: Int
    public let name: String
    public let coord: CoordinateDTO
    public let country: String
    
    public init(
        id: Int,
        name: String,
        coord: CoordinateDTO,
        country: String
    ) {
        
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
    }
}
