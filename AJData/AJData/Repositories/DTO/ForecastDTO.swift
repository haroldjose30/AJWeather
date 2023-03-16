//
//  ForecastDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

public struct ForecastDTO {
    
    public let cod: String
    public let message: Int
    public let cnt: Int
    public let list: [ForecastDetailDTO]
    public let city: CityDTO
    
    public init(
        cod: String,
        message: Int,
        cnt: Int,
        list: [ForecastDetailDTO],
        city: CityDTO
    ) {
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.list = list
        self.city = city
    }
}
