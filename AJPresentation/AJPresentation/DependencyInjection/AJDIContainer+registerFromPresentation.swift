//
//  AJDIContainer+registerFromPresentation.swift
//  AJPresentation
//
//  Created by Jose Harold on 15/03/2023.
//

import AJDependencyInjection
import AJDomain

public extension AJDIContainer {
    
    func registerFromPresentation() {
        
        self.register(type: HomeViewModel.self) { container in
            HomeViewModel(
                getWeatherByCityUseCase: try container.resolve(type: GetWeatherByCityUseCaseType.self)
            )
        }
    }
}
