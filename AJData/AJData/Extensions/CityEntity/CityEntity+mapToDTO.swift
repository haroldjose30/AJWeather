//
//  CityEntity+mapToDTO.swift
//  AJData
//
//  Created by Jose Harold on 17/03/2023.
//

extension CityEntity {
    
    func mapToDTO() -> CityDTO {
        
        CityDTO(
            id: self.id,
            name: self.name,
            latitude: self.latitude,
            longitude: self.longitude,
            country: self.country
        )
    }
}
