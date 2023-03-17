//
//  WeatherEntity+mapToDTO.swift.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

extension WeatherEntity {
    
    func mapToDTO() -> WeatherDTO {
        
        WeatherDTO(
            id: self.id,
            weatherId: self.weatherId,
            main: self.main,
            desc: self.desc,
            icon: self.icon
        )
    }
}
