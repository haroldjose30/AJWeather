//
//  ForecastViewObject.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

struct HomeViewObject  {
    
    let title: String
    let dates: [DateViewObject]
    
    struct DateViewObject {
        let date: String
        let hours: [HourViewObject]
    }
    
    struct HourViewObject {
        let time: String
        let temperature: String
        let iconUrl: String
        let description: String
    }
}
