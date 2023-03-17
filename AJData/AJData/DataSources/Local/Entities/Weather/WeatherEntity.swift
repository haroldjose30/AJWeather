//
//  WeatherEntity.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

struct WeatherEntity: EntityType {
    
    var id: String {
        "\(fkForecastDetailId)_\(weatherId)"
    }
    let weatherId: String
    let fkForecastDetailId: String
    let main: String
    let desc: String
    let icon: String
}

