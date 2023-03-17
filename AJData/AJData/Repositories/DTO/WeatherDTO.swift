//
//  WeatherDTO.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

public struct WeatherDTO {
    
    public let id: String
    public let weatherId: String
    public let main: String
    public let desc: String
    public let icon: String
    
    public init(
        id: String,
        weatherId: String,
        main: String,
        desc: String,
        icon: String
    ) {
        
        self.id = id
        self.weatherId = weatherId
        self.main = main
        self.desc = desc
        self.icon = icon
    }
}
