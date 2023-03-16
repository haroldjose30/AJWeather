//
//  SpyForecastRepository.swift
//  AJDomainTests
//
//  Created by Jose Harold on 15/03/2023.
//

import Combine
import AJData

class SpyForecastRepository: ForecastRepositoryType {
    
    private(set) var getByCalled = false
    var getByToReturn: Future<ForecastDTO, Error> = Future { promisse in
        promisse(.success(ForecastDTO.fixture()))
    }
    func getBy(
        latitude: Float,
        longitude: Float
    ) -> Future<ForecastDTO, Error> {
        
        getByCalled = true
        return getByToReturn
    }
}
