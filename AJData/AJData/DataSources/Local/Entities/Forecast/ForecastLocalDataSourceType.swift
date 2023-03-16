//
//  ForecastLocalDataSourceType.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

protocol ForecastLocalDataSourceType {
    
    func saveInCache(
        _ forecastDTO: ForecastDTO
    ) async throws
    
    func getFromCacheBy(
        latitude: Float,
        longitude: Float
    ) async throws -> ForecastDTO?
}
