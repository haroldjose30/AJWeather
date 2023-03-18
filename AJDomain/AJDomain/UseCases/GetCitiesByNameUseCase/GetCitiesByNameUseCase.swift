//
//  GetCitiesByNameUseCase.swift
//  AJDomain
//
//  Created by Jose Harold on 17/03/2023.
//

import Combine
import AJData

final class GetCitiesByNameUseCase: GetCitiesByNameUseCaseType {
    
    private var repository: CityRepositoryType
    private let scheduler: SchedulerType
    
    public init(
        repository: CityRepositoryType,
        scheduler: SchedulerType
    ) {
        self.scheduler = scheduler
        self.repository = repository
    }
    
    func execute(
        name: String,
        from origin: DataSourceOrigin
    ) -> AnyPublisher<[CityModel], Error> {
        
        return repository
            .getBy(
                name: name,
                from: origin
            )
            .map({ citiesDTO in
                citiesDTO.map{ $0.mapToModel()}
            })
            .subscribe(on: scheduler.execution)
            .receive(on: scheduler.postExecution)
            .eraseToAnyPublisher()
    }
}
