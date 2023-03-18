//
//  ForecastLocalDataSource.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

final class ForecastLocalDataSource: ForecastLocalDataSourceType {
    
    //TODO: change to protocol to be testable
    private let cityLocalDataSource: CityLocalDataSource
    private let forecastDetailLocalDataSource: ForecastDetailLocalDataSource
    private let weatherLocalDataSource: WeatherLocalDataSource
    
    init(
        cityLocalDataSource: CityLocalDataSource,
        forecastDetailLocalDataSource: ForecastDetailLocalDataSource,
        weatherLocalDataSource: WeatherLocalDataSource
    ) {
        self.cityLocalDataSource = cityLocalDataSource
        self.forecastDetailLocalDataSource = forecastDetailLocalDataSource
        self.weatherLocalDataSource = weatherLocalDataSource
    }
    
    func saveInCache(
        _ forecastDTO: ForecastDTO
    ) async throws {
        
        //TODO: I Tryed to work first in memory, like a transaction, and improve perfomance, but I have throbles with coreData
        //I need to search the bether way to do this in memory and save all after completed
        
//        cityLocalDataSource.setAutomaticSaveContext(false)
        
//        defer {
//            //return to automatic save
//            cityLocalDataSource.setAutomaticSaveContext(true)
//        }
        
        do {
            
            // MARK: - save cityEntity
            let cityEntity = forecastDTO.city.mapToEntity()
            try await cityLocalDataSource.create(entity: cityEntity)
            
            // MARK: - save forecastDetailEntity
            for forecastDetailDTO in forecastDTO.list {
                
                let forecastDetailEntity = forecastDetailDTO.mapToEntity(
                    fkCityId: cityEntity.id
                )
                
                try await forecastDetailLocalDataSource.create(
                    entity: forecastDetailEntity
                )
                
                // MARK: - save weatherEntity
                for weatherDTO in forecastDetailDTO.weather {
                    
                    let weatherEntity = weatherDTO.mapToEntity(
                        fkForecastDetailId: forecastDetailEntity.id
                    )
                    
                    try await weatherLocalDataSource.create(
                        entity: weatherEntity
                    )
                }
            }
            
            // MARK: - persist in database
//            cityLocalDataSource.saveContext(forceSave: true)
            
        } catch let error {
            
            print("CoreDataError:",error.localizedDescription)
//            cityLocalDataSource.rollback()
        }
    }
    
    func getFromCacheBy(
        latitude: Float,
        longitude: Float
    ) async throws -> ForecastDTO? {
        
        //Try to locate City
        guard let cityDTO = try? await cityLocalDataSource.getBy(
                latitude: latitude,
                longitude: longitude
        ).map({ $0.mapToDTO() })
        else {
            return nil
        }
        
        var forecastDetailDTOList: [ForecastDetailDTO] = []
        
        if let forecastDetailEntityList = try? await forecastDetailLocalDataSource.getAllBy(
            cityId: cityDTO.id
        ) {
            
            for forecastDetailEntity in forecastDetailEntityList {
                
                let weatherDTOList = try? await weatherLocalDataSource.getAllBy(
                    fkForecastDetailId: forecastDetailEntity.id
                ).map({ $0.mapToDTO() })
                
                let forecastDetailDTO = forecastDetailEntity.mapToDTO(weathers: weatherDTOList ?? [])
                
                forecastDetailDTOList.append(forecastDetailDTO)
            }
        }
        
        return ForecastDTO(
            city: cityDTO,
            list: forecastDetailDTOList
        )
    }
}
