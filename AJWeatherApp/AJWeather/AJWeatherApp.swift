//
//  AJWeatherApp.swift
//  AJWeather
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI
import AJDependencyInjection
import AJPresentation

@main
struct AJWeatherApp: App {
    
    //TODO: add to a coordinator
    private let viewModel: HomeViewModel
    
    init() {
        
        AJDIContainer().registerAllServices()
        guard let viewModel = try? AJDIContainer().resolve(type: HomeViewModel.self) else {
            fatalError("HomeViewModel not registered on DI")
        }
        self.viewModel = viewModel
    }
    
    var body: some Scene {

        return WindowGroup {

            HomePage<HomeViewModel>(
                viewModel: viewModel
            )
        }
    }
}
