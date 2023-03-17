//
//  ForecastModel+mapToHomeViewObject.swift
//  AJPresentation
//
//  Created by Jose Harold on 13/03/2023.
//

import AJDomain

extension ForecastModel {
    
    func mapToHomeViewObject() -> HomeViewObject {
        
        var dates: [HomeViewObject.DateViewObject] = []
        self.list
            .sorted(by: {$0.date < $1.date})
            .forEach { detail in
                
                let date = detail.date.toDate()
                let dateFormatted = date.formatterToRelative()
                let time = date.formatterToTime()
                
                var dateViewObject: HomeViewObject.DateViewObject? = dates.first(where: { $0.date == dateFormatted})
                if dateViewObject == nil {
                    
                    dateViewObject =  HomeViewObject.DateViewObject(
                        date: dateFormatted,
                        hours: []
                    )
                    if let dateViewObject {
                        dates.append(dateViewObject)
                    }
                }
                
                if !(dateViewObject?.hours.contains(where: {$0.time == time}) ?? false) {
                    
                    dateViewObject?.hours.append(
                        HomeViewObject.HourViewObject(
                            time: time,
                            temperature: "\(detail.temperature) °c",
                            iconUrl: getIconUrl(detail.weather.first?.icon),
                            description: detail.weather.first?.desc ?? ""
                        )
                    )
                }
            }
        
        return HomeViewObject(
            city: self.city,
            title: "\(self.city.name),\(self.city.country)",
            dates: dates
        )
    }
}

private extension ForecastModel {
    
    
    func getIconUrl(_ icon: String?) -> String {
        
        guard let icon = icon else  {
            return ""
        }
        
        return "https://openweathermap.org/img/wn/\(icon)@2x.png"
    }
}
