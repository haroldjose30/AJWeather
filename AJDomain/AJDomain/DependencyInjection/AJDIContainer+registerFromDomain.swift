//
//  AJDIContainer+registerFromDomain.swift
//  AJDomain
//
//  Created by Jose Harold on 15/03/2023.
//

import AJDependencyInjection
import AJData

public extension AJDIContainer {
    
    func registerFromDomain() {
        
        self.register(type: SchedulerType.self) { _ in
            SchedulerDefault()
        }
        
        self.register(type: GetForecastUseCaseType.self) { container in
            GetForecastUseCase(
                repository: try container.resolve(type: ForecastRepositoryType.self),
                scheduler: try container.resolve(type: SchedulerType.self)
            )
        }
        
        self.register(type: GetCitiesByNameUseCaseType.self) { container in
            GetCitiesByNameUseCase(
                repository: try container.resolve(type: CityRepositoryType.self),
                scheduler: try container.resolve(type: SchedulerType.self)
            )
        }
    }
}
