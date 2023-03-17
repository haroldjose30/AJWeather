//
//  CityResponse+mapToDTO.swift
//  AJData
//
//  Created by Jose Harold on 17/03/2023.
//

extension CityResponse {
    
    func mapToDTO() -> CityDTO {
        
        CityDTO(
            id: String(self.id),
            name: self.name,
            latitude: self.coord.lat,
            longitude: self.coord.lon,
            country: self.country
        )
    }
}
