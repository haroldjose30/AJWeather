//
//  CityRepository.swift
//  AJData
//
//  Created by Jose Harold on 17/03/2023.
//

import Combine

final class CityRepository: CityRepositoryType {
    
    private let cityLocalDataSource: CityLocalDataSource
    private let cityRemoteDataSource: CityRemoteDataSourceType
    
    init(
        cityLocalDataSource: CityLocalDataSource,
        cityRemoteDataSource: CityRemoteDataSourceType
    ) {
        self.cityLocalDataSource = cityLocalDataSource
        self.cityRemoteDataSource = cityRemoteDataSource
    }
    
    public func getBy(
        name: String,
        from origin: DataSourceOrigin
    ) -> AnyPublisher<[CityDTO], Error> {

        
        switch origin {

        case .local:
            return cityLocalDataSource.getAllRx()
                .map { cityEntities in
                    cityEntities.map { $0.mapToDTO() }
                }
                .eraseToAnyPublisher()
            
            
        case .remote:
            
            
            return cityRemoteDataSource.getCityBy(
                name: name
            )
            .map { [$0.mapToDTO()] }
            .eraseToAnyPublisher()
        }
        
        
    }
    
}
