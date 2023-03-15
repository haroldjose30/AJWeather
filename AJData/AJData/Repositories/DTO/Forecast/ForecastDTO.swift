//
//  ForecastDTO.swift
//  AJData
//
//  Created by Jose Harold on 12/03/2023.
//

public struct ForecastDTO {
    
    public let city: CityDTO
    public let list: [ForecastDTO.DetailDTO]
    
    public init(
        city: CityDTO,
        list: [ForecastDTO.DetailDTO]
    ) {
        self.city = city
        self.list = list
    }
}


