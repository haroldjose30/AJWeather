//
//  OpenWeatherEndpoint.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

enum OpenWeatherEndpoint {
    
    static let baseUrl = "https://api.openweathermap.org"
    static let appid = "1167bb2c2809b587df555190804f6916"
    
    enum Resource {
        static let forecast = "/data/2.5/forecast"
        static let direct = "/geo/1.0/direct"
        static let weather = "/data/2.5/weather"
        
        
    }
}
