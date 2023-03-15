//
//  ForecastRemoteType.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import Combine

protocol ForecastRemoteDataSourceType {
    
    func getBy(
        latitude: Double,
        longitude: Double
    ) -> Future<ForecastResponseDTO, Error>
    
}
