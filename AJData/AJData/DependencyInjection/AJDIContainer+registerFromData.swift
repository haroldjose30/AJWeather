//
//  AJDIContainer+registerFromData.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import AJDependencyInjection
import AJHttpClient

public extension AJDIContainer {
    
    func registerFromData() {
        
        CoreDataManager.getInstance().initialize()
        
        self.register(type: AJHttpClientType.self) { _ in
            AJHttpClient()
        }
        
        self.register(type: ForecastRemoteDataSourceType.self) { container in
            ForecastRemoteDataSource(
                httpClient: try container.resolve(type: AJHttpClientType.self)
            )
        }
        
        self.register(type: CityLocalDataSource.self) { container in
            CityLocalDataSource()
        }
        
        self.register(type: ForecastLocalDataSourceType.self) { container in
            ForecastLocalDataSource(
                cityLocalDataSource: try container.resolve(type: CityLocalDataSource.self)
            )
        }
        
        self.register(type: ForecastRepositoryType.self) { container in
            ForecastRepository(
                remoteDataSource: try container.resolve(type: ForecastRemoteDataSourceType.self),
                localDataSource: try container.resolve(type: ForecastLocalDataSourceType.self)
            )
        }
    }
}
