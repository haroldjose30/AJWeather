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
                getForecastUseCase: try container.resolve(type: GetForecastUseCaseType.self)
            )
        }
        
        self.register(type: CityDetailViewModel.self) { container in
            CityDetailViewModel()
        }
        
        self.register(type: CitySearchViewModel.self) { container in
            CitySearchViewModel(
                getCitiesByNameUseCase:  try container.resolve(type: GetCitiesByNameUseCaseType.self)
            )
        }
    }
}
