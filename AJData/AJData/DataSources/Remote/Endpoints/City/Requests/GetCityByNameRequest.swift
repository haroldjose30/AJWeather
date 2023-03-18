//
//  GetCityByNameRequest.swift
//  AJData
//
//  Created by Jose Harold on 18/03/2023.
//

import Foundation
import AJHttpClient

struct GetCityByNameRequest: AJHttpRequestGetJson {
    
    typealias ResponseType = CityResponse
    var queryParameters: AJHttpQueryParameters = [:]
    var urlBase: String
    var path: String
    var headers: AJHttpHeaders = [:]
    
    init(
        name: String
    ) {
        self.urlBase = OpenWeatherEndpoint.baseUrl
        self.path = OpenWeatherEndpoint.Resource.weather
        
        self.headers =  [
            "Content-Type": "application/json",
            "User-Agent": "AJWeatherApp"
        ]
        
        self.queryParameters = [
            "appid": OpenWeatherEndpoint.appid,
            "q": name,
        ]
    }
}
