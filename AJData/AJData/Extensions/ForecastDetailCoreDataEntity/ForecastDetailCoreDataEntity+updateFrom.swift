//
//  ForecastDetailCoreDataEntity+updateFrom.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension ForecastDetailCoreDataEntity {
    
    func updateFrom(_ entity: ForecastDetailEntity) {
        
        self.id = entity.id
        self.fkCityId = entity.fkCityId
        self.dt = entity.dt.toInt32()
        self.temp = entity.temp
        self.feelsLike = entity.feelsLike
        self.tempMin = entity.tempMin
        self.tempMax = entity.tempMax
        self.humidity = entity.humidity.toInt32()
    }
}
