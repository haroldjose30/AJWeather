//
//  GetForecastRequest.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import AJHttpClient

struct GetForecastRequest: AJHttpRequestGetJson {
    
    typealias ResponseType = ForecastResponse
    var queryParameters: AJHttpQueryParameters = [:]
    var urlBase: String
    var path: String
    var headers: AJHttpHeaders = [:]
    
    init(
        latitude: Float,
        longitude: Float
    ) {
        self.urlBase = OpenWeatherEndpoint.baseUrl
        self.path = OpenWeatherEndpoint.Resource.forecast
        
        self.headers =  [
            "Content-Type": "application/json",
            "User-Agent": "AJWeatherApp"
        ]
        
        self.queryParameters = [
            "appid": OpenWeatherEndpoint.appid,
            "lat": latitude.toString(),
            "lon": longitude.toString(),
            "units": "metric"
        ]
    }
}


private extension Float {
    
    func toString() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
        formatter.groupingSeparator = ""
        let number = NSNumber(value: self)
        return formatter.string(from: number) ?? String(self)
    }
}

