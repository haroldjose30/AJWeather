//
//  ForecastModel.swift
//  AJDomain
//
//  Created by Jose Harold on 12/03/2023.
//

public struct ForecastModel {
    
    public let city: CityModel
    public let list: [ForecastModel.Detail]
    
    public init(
        city: CityModel,
        list: [ForecastModel.Detail]
    ) {
        self.city = city
        self.list = list
    }
}


