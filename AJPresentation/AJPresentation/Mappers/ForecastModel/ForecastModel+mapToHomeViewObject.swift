//
//  ForecastModel+mapToViewObject.swift
//  AJPresentation
//
//  Created by Jose Harold on 13/03/2023.
//

import AJDomain

extension ForecastModel {
    
    func mapToHomeViewObject() -> HomeViewObject {
        
        
        var dates: [HomeViewObject.DateViewObject] = []

        self.list.forEach { detail in

            let date = getFormatedDate(detail.date)
            let time = getFormatedTime(detail.date)
            
            var dateViewObject: HomeViewObject.DateViewObject? = dates.first(where: { $0.date == date})
            if dateViewObject == nil {
                
                dateViewObject =  HomeViewObject.DateViewObject(
                    date: date,
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
                        temperature: "\(detail.main.temperature) °C",
                        iconUrl: getIconUrl(detail.weather.first?.icon),
                        description: detail.weather.first?.description ?? ""
                    )
                )
            }
        }

        return HomeViewObject(
            title: self.city.name,
            dates: dates
        )
    }
    
    
    private func getFormatedDate(_ date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM dd"
        
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.timeStyle = .none
        relativeDateFormatter.dateStyle = .medium
        relativeDateFormatter.doesRelativeDateFormatting = true
        
        let datestr = relativeDateFormatter.string(from: date)
        if let _ = datestr.rangeOfCharacter(from: .decimalDigits) {
            return dateFormatter.string(from: date)
        } else {
            return datestr
        }
    }
    
    private func getFormatedTime(_ date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
    
    private func getIconUrl(_ icon: String?) -> String {
        guard let icon = icon else  {
            return ""
        }
        
        return "https://openweathermap.org/img/wn/\(icon)@2x.png"
    }
}
