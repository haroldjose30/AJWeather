//
//  ForecastResponse+mapToDTO.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

extension ForecastResponse {
    
    func mapToDTO() -> ForecastDTO {
        
        ForecastDTO(
            city: self.city.mapToDTO(),
            list: self.list.map{ $0.mapToDTO() }
        )
    }
}
