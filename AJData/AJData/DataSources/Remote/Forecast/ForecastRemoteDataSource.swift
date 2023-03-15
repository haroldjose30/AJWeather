//
//  ForecastAPI.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import AJHttpClient
import Combine

final class ForecastRemoteDataSource: ForecastRemoteDataSourceType {
    
    let httpClient: AJHttpClientType
    private var cancellables: Set<AnyCancellable> = []
    
    init(
        httpClient: AJHttpClientType
    ) {
        self.httpClient = httpClient
    }
    
    func getBy(
        latitude: Double,
        longitude: Double
    ) -> Future<ForecastResponseDTO, Error> {
        
        let request = GetForecastRequest(
            latitude: latitude,
            longitude: longitude
        )
        
        return Future(){ promise in
            self.httpClient.send(request)
                .asJson()
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(let error):
                            promise(Result.failure(error))                            
                        }
                        
                    },
                    receiveValue: { response in
                        promise(Result.success(response))
                    }
                )
                .store(in: &self.cancellables)
        }
    }
}
