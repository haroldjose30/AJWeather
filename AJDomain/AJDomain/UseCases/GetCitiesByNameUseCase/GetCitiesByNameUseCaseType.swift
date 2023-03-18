//
//  GetCitiesFromCacheType.swift
//  AJDomain
//
//  Created by Jose Harold on 17/03/2023.
//

import Combine
import AJData

public protocol GetCitiesByNameUseCaseType {
    
    func execute(
        name: String,
        from origin: DataSourceOrigin
    ) -> AnyPublisher<[CityModel], Error>
}

