//
//  ForecastRepositoryType.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import Combine

public protocol ForecastRepositoryType {
    
    func getBy(
        latitude: Float,
        longitude: Float
    ) -> Future<ForecastDTO, Error>
    
}
