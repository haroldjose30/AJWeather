//
//  GetForecastUseCaseType.swift
//  AJDomain
//
//  Created by Jose Harold on 13/03/2023.
//

import Combine
import AJData

final class GetForecastUseCase: GetForecastUseCaseType {
    
    private var repository: ForecastRepositoryType
    private let scheduler: SchedulerType
   
    public init(
        repository: ForecastRepositoryType,
        scheduler: SchedulerType
    ) {
        self.scheduler = scheduler
        self.repository = repository
    }
    
    public func execute(
        latitude: Double,
        longitude: Double
    ) -> AnyPublisher<ForecastModel, Error> {
        
        return repository
            .getBy(
                latitude: latitude,
                longitude: longitude
            )
            .map { forecastDTO -> ForecastModel in
                forecastDTO.mapToForecastModel()
            }
            .subscribe(on: scheduler.execution)
            .receive(on: scheduler.postExecution)
            .eraseToAnyPublisher()
    }
}
