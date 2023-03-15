//
//  File.swift
//  AJWeatherApp
//
//  Created by Jose Harold on 15/03/2023.
//

import AJDependencyInjection

public extension AJDIContainer {
    
    func registerAllServices() {
        
        registerFromPresentation()
        registerFromDomain()        
    }
}
