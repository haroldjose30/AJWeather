//
//  ForecastLocalDataSource.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

final class ForecastLocalDataSource: ForecastLocalDataSourceType {
    
    //TODO: change to protocol to be testable
    private let cityLocalDataSource: CityLocalDataSource
    
    init(cityLocalDataSource: CityLocalDataSource) {
        self.cityLocalDataSource = cityLocalDataSource
    }
    
    func saveInCache(_ forecastDTO: ForecastDTO) async throws {
        
        let cityEntity = forecastDTO.city.mapToCityEntity()
        try await cityLocalDataSource.create(entity: cityEntity)
    }
    
    func getFromCacheBy(
        latitude: Float,
        longitude: Float
    ) async throws -> ForecastDTO? {
      
        
        guard
            let city = try await cityLocalDataSource.getBy(
                latitude: latitude,
                longitude: longitude
            )
        else {
            return nil
        }
        
        return ForecastDTO(
            cod: "",
            message: 0,
            cnt: 0,
            list: [],
            city: CityDTO(
                id: city.id,
                name: city.name,
                coord: CoordinateDTO(
                    latitude: city.latitude,
                    longitude: city.longitude
                ),
                country: city.country
            )
        )
        
    }
}
