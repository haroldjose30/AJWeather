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
    
    init() {
        //Inicialize Dependency Services
        AJDIContainer().registerAllServices()
    }
    
    var body: some Scene {

        return WindowGroup {
            AppRouterView()
                .environmentObject(AppRouterState())
           
        }.onChange(of: scenePhase) { _ in
            
            //TODO: Add an UseCase to Save DataBase and avoid direct access
            CoreDataManager.getInstance().saveContext()
        }
    }
}


