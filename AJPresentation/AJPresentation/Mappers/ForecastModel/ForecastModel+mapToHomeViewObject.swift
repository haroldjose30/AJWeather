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
        self.list
            .sorted(by: {$0.date < $1.date})
            .forEach { detail in
                
                let date = getDateFromUnix(detail.date)
                let dateFormatted = getFormattedDate(date)
                let time = getFormattedTime(date)
                
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
                            temperature: "\(detail.main.temp) °C",
                            iconUrl: getIconUrl(detail.weather.first?.icon),
                            description: detail.weather.first?.description ?? ""
                        )
                    )
                }
            }
        
        return HomeViewObject(
            title: "\(self.city.name),\(self.city.country)",
            dates: dates
        )
    }
}

private extension ForecastModel {
    
    func getDateFromUnix(_ dateInt: Double) -> Date {
        Date(timeIntervalSince1970: dateInt)
    }
    
    func getFormattedDate(_ date: Date) -> String {
        
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
    
    func getFormattedTime(_ date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
    
    func getIconUrl(_ icon: String?) -> String {
        guard let icon = icon else  {
            return ""
        }
        
        return "https://openweathermap.org/img/wn/\(icon)@2x.png"
    }
}
