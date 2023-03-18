//
//  GetForecastUseCaseType.swift
//  AJDomain
//
//  Created by Jose Harold on 13/03/2023.
//

import Combine

public protocol GetForecastUseCaseType {
    
    func execute(
        latitude: Float,
        longitude: Float
    ) -> AnyPublisher<ForecastModel, Error>
}
