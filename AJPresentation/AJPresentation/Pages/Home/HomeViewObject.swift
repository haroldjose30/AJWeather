//
//  ForecastViewObject.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import AJDomain

public class HomeViewObject  {
    
    var city: CityModel
    var title: String
    var dates: [DateViewObject]
    
    public init(
        city: CityModel,
        title: String,
        dates: [DateViewObject]
    ) {
        self.city = city
        self.title = title
        self.dates = dates
    }
}

extension HomeViewObject {
    
    public class DateViewObject {
        
        var date: String
        var hours: [HourViewObject]
        
        public init(
            date: String,
            hours: [HourViewObject]
        ) {
            self.date = date
            self.hours = hours
        }
    }
}


extension HomeViewObject {
    
    public class HourViewObject {
        
        var time: String
        var temperature: String
        var iconUrl: String
        var description: String
        
        public init(
            time: String,
            temperature: String,
            iconUrl: String,
            description: String
        ) {
            
            self.time = time
            self.temperature = temperature
            self.iconUrl = iconUrl
            self.description = description
        }
    }
    
}
