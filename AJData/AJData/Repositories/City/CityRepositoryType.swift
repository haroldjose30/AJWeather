//
//  CityRepositoryType.swift
//  AJData
//
//  Created by Jose Harold on 17/03/2023.
//

import Combine

public protocol CityRepositoryType {
    
    func getBy(
        name: String,
        from origin: DataSourceOrigin
    ) -> AnyPublisher<[CityDTO], Error> 
}
