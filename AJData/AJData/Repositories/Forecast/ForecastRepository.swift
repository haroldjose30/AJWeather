//
//  ForecastRepository.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import Combine

final class ForecastRepository: ForecastRepositoryType {
    
    private var cancellables: Set<AnyCancellable>
    let remoteDataSource: ForecastRemoteDataSourceType
    let localDataSource: ForecastLocalDataSourceType
    
    init(
        remoteDataSource: ForecastRemoteDataSourceType,
        localDataSource: ForecastLocalDataSourceType
    ) {
        self.cancellables = []
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getBy(
        latitude: Double,
        longitude: Double
    ) -> Future<ForecastDTO, Error> {
        
        
        //if not exists connection seach from localDataSource
        
        //if has connection try to search from remoteDataSource
        return Future { [self] promise in
            
            self.remoteDataSource.getBy(
                latitude: latitude,
                longitude: longitude
            )
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        promise(.failure(error))
                    }
                    
                }, receiveValue: { forecastResponseDTO in
                    promise(
                        Result.success(
                            forecastResponseDTO.maptoForecastDTO()
                        )
                    )
                })
            .store(in: &self.cancellables)
        }
        
        
        //save remote data on local cache
        
        //return remoteDataSource
    }
    
}
