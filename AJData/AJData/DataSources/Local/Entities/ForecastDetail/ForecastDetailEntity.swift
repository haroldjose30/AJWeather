//
//  ForecastDetailEntity.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

struct ForecastDetailEntity: EntityType {
    
    var id: String {
        "\(fkCityId)_\(dt)"
    }
    let fkCityId: String
    let dt: Int
    let temp: Float
    let feelsLike: Float
    let tempMin: Float
    let tempMax: Float
    let humidity: Int
}

