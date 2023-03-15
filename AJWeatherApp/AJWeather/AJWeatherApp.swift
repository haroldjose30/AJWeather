//
//  AJWeatherApp.swift
//  AJWeather
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI
import AJDependencyInjection
import AJPresentation
import AJData

@main
struct AJWeatherApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    private let viewModel: HomeViewModel
    
    init() {
        
        AJDIContainer().registerAllServices()
        
        //TODO: add to a coordinator
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
            //CoreDataTestView()
            //    .environment(\.managedObjectContext, CoreDataPersistenceDataBase.shared.container.viewContext)
        }.onChange(of: scenePhase) { _ in
            //TODO: Add an UseCase to Save DataBase and avoid direct access
            CoreDataPersistenceDataBase.shared.save()
        }
    }
}
