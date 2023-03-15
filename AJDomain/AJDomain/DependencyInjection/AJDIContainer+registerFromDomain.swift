//
//  AJDIContainer+registerFromDomain.swift
//  AJDomain
//
//  Created by Jose Harold on 15/03/2023.
//

import AJDependencyInjection

public extension AJDIContainer {
    
    func registerFromDomain() {
        
        self.register(type: SchedulerType.self) { _ in
            SchedulerDefault()
        }
        
        self.register(type: GetWeatherByCityUseCaseType.self) { container in
            GetWeatherByCityUseCase(
                scheduler: try container.resolve(type: SchedulerType.self)
            )
        }
    }
}
