//
//  WeatherModel.swift
//  AJDomain
//
//  Created by Jose Harold on 12/03/2023.
//

public struct WeatherModel {
    
    public let id: String
    ///Weather condition id
    public let weatherId: String
    ///Group of weather parameters (Rain, Snow, Extreme etc.)
    public let main: String
    public let description: String
    public let icon: String
    
    public init(
        id: String,
        weatherId: String,
        main: String,
        description: String,
        icon: String
    ) {
        
        self.id = id
        self.weatherId = weatherId
        self.main = main
        self.description = description
        self.icon = icon
    }
}
