//
//  ForecastRepository.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import Combine

enum ForecastRepositoryError: Error {
    case dataNotExists
}

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
        latitude: Float,
        longitude: Float
    ) -> Future<ForecastDTO, Error> {
        
        
        //if not exists connection seach from localDataSource
        if !Reachability.isConnectedToNetwork(){
            
            
            return Future { promise in
                
                Task {
                    guard
                        let forecastDTO = try? await self.localDataSource.getFromCacheBy(
                            latitude: latitude,
                            longitude: longitude
                        )
                    else {
                        promise(Result.failure(ForecastRepositoryError.dataNotExists))
                        return
                    }
                    
                    promise(Result.success(forecastDTO))
                }
                
            }
        }
       
        //get from remote
        return Future { [self] promise in
            
            return self.remoteDataSource.getBy(
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
                    
                    let forecastDTO = forecastResponseDTO.mapToDTO()
                    Task {
                        //save remote data on local cache
                        try await self.localDataSource.saveInCache(forecastDTO)
                        promise(Result.success(forecastDTO))
                    }
                })
            .store(in: &self.cancellables)
        }
    }
    
}
