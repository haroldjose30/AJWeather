//
//  ForecastDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

public struct ForecastDTO {
    
    public let city: CityDTO
    public let list: [ForecastDetailDTO]
    
    public init(
        city: CityDTO,
        list: [ForecastDetailDTO]
    ) {
        
        self.city = city
        self.list = list
    }
}
