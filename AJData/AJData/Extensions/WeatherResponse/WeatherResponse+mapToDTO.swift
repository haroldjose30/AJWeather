//
//  WeatherResponse+mapToDTO.swift
//  AJData
//
//  Created by Jose Harold on 17/03/2023.
//

extension WeatherResponse {
    
    func mapToDTO() -> WeatherDTO {
        
        WeatherDTO(
            id: String(self.id),
            weatherId: String(self.id),
            main: self.main,
            desc: self.description,
            icon: self.icon
        )
    }
}
