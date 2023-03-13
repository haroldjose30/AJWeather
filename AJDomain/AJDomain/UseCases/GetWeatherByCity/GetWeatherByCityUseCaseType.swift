//
//  GetWeatherByCityUseCaseType.swift
//  AJDomain
//
//  Created by Jose Harold on 13/03/2023.
//

import Combine

public protocol GetWeatherByCityUseCaseType {
    
    func execute(
        city: String,
        country: String
    ) -> AnyPublisher<ForecastModel, Error>
}
