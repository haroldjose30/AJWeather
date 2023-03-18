//
//  CityRemoteDataSource.swift
//  AJData
//
//  Created by Jose Harold on 18/03/2023.
//

import AJHttpClient
import Combine

final class CityRemoteDataSource: CityRemoteDataSourceType {
    
    let httpClient: AJHttpClientType
    private var cancellables: Set<AnyCancellable> = []
    
    init(
        httpClient: AJHttpClientType
    ) {
        self.httpClient = httpClient
    }
    
    func getCityBy(
        name: String
    ) -> Future<CityResponse, Error> {
        
        let request = GetCityByNameRequest(name: name)
        
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
