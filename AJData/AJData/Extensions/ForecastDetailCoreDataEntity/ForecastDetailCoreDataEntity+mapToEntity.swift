//
//  ForecastDetailCoreDataEntity+mapToEntity.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension ForecastDetailCoreDataEntity {
    
    func mapToEntity() -> ForecastDetailEntity {
        
        ForecastDetailEntity(
            fkCityId: self.fkCityId ?? "",
            dt: self.dt.toInt(),
            temp: self.temp,
            feelsLike: self.feelsLike,
            tempMin: self.tempMin,
            tempMax: self.tempMax,
            humidity: self.humidity.toInt(),
            dtTxt: self.dtTxt ?? ""
        )
    }
}
