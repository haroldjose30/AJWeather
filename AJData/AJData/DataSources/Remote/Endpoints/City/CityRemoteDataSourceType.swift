//
//  CityRemoteDataSourceType.swift
//  AJData
//
//  Created by Jose Harold on 18/03/2023.
//

import Combine

protocol CityRemoteDataSourceType {
    
    func getCityBy(
        name: String
    ) -> Future<CityResponse, Error>
}
