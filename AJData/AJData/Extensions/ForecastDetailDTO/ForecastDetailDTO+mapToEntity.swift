//
//  ForecastDetailDTO+mapToEntity.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension ForecastDetailDTO {
    
    func mapToEntity(
        fkCityId: String
    ) -> ForecastDetailEntity {
        
        ForecastDetailEntity(
            fkCityId: fkCityId,
            dt: self.dt,
            temp: self.main.temp,
            feelsLike: self.main.feelsLike,
            tempMin: self.main.tempMin,
            tempMax: self.main.tempMax,
            humidity: self.main.humidity,
            dtTxt: self.dtTxt
        )
    }
}
