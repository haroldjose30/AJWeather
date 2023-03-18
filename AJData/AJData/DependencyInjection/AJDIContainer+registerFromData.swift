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
        
        //Inicialize CoreData services
        CoreDataManager.getInstance().initialize()
        
        self.register(type: AJHttpClientType.self) { _ in
            AJHttpClient()
        }
        
        self.register(type: ForecastRemoteDataSourceType.self) { container in
            ForecastRemoteDataSource(
                httpClient: try container.resolve(type: AJHttpClientType.self)
            )
        }
        
        self.register(type: ForecastLocalDataSourceType.self) { container in
            ForecastLocalDataSource(
                cityLocalDataSource: CityLocalDataSource(),
                forecastDetailLocalDataSource: ForecastDetailLocalDataSource(),
                weatherLocalDataSource: WeatherLocalDataSource()
            )
        }
        
        self.register(type: ForecastRepositoryType.self) { container in
            ForecastRepository(
                remoteDataSource: try container.resolve(type: ForecastRemoteDataSourceType.self),
                localDataSource: try container.resolve(type: ForecastLocalDataSourceType.self)
            )
        }
        
        self.register(type: CityRemoteDataSourceType.self) { container in
            CityRemoteDataSource(
                httpClient: try container.resolve(type: AJHttpClientType.self)
            )
        }
        
        self.register(type: CityRepositoryType.self) { container in
            CityRepository(
                cityLocalDataSource: CityLocalDataSource(),
                cityRemoteDataSource:  try container.resolve(type: CityRemoteDataSourceType.self)
            )
        }
    }
}
