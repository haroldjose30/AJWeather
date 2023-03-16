//
//  WeatherDTO.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

public struct WeatherDTO {
    
    public let id: Int
    public let main: String
    public let description: String
    public let icon: String
    
    public init(
        id: Int,
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
