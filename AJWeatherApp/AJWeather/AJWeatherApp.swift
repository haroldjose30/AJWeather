//
//  AJWeatherApp.swift
//  AJWeather
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI
import AJPresentation
import AJDomain

@main
struct AJWeatherApp: App {
    var body: some Scene {
        
        //TODO: Add DI
        let getWeatherByCityUseCase: GetWeatherByCityUseCaseType = GetWeatherByCityUseCase()
        
        return WindowGroup {
            
            HomePage<HomeViewModel>(
                viewModel: HomeViewModel(
                    getWeatherByCityUseCase: getWeatherByCityUseCase
                )
            )
        }
    }
}
