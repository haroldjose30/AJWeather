//
//  WeatherModel.swift
//  AJDomain
//
//  Created by Jose Harold on 12/03/2023.
//

public struct WeatherModel {
    
    ///Weather condition id
    public let id: String
    ///Group of weather parameters (Rain, Snow, Extreme etc.)
    public let main: String
    public let description: String
    public let icon: String
    
    public init(
        id: String,
        main: String,
        description: String,
        icon: String
    ) {
        
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}
