//
//  ForecastRepositoryType.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import Combine

public protocol ForecastRepositoryType {
    
    func getBy(
        latitude: Double,
        longitude: Double
    ) -> Future<ForecastDTO, Error>
    
}
