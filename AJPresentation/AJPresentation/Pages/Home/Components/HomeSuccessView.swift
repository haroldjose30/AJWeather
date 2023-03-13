//
//  SuccessView.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI

struct HomeSuccessView: View {
    
    let data: HomeViewObject
    
    var body: some View {
        
        VStack {
            Text(data.title)
                .font(.largeTitle)
            
            
            if data.dates.isEmpty {
                EmptyDateView()
            } else {
                List(data.dates, id: \.date) { dateGroup in
                    Section(header: SectionView(text: dateGroup.date)) {
                        ForEach(dateGroup.hours, id: \.time) { hourDetail in
                            RowView(hour: hourDetail)
                        }
                    }
                }.listStyle(.insetGrouped)
            }
            
        }
    }
    
    struct EmptyDateView: View {
        
        var body: some View {
            VStack {
                Spacer()
                Text(Localizable.emptyDate)
                    .font(.title2)
                Spacer()
            }
        }
    }
}

struct HomeSuccessView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeSuccessView(
            data: HomeViewObject(
                title: "Aveiro,PT",
                dates: [
                    HomeViewObject.DateViewObject(
                        date: "Today",
                        hours: [
                            HomeViewObject.HourViewObject(
                                time: "3:00am",
                                temperature: "13 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "6:00am",
                                temperature: "14 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "9:00am",
                                temperature: "15 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                        ]
                    ),
                    HomeViewObject.DateViewObject(
                        date: "Tomorow",
                        hours: [
                            HomeViewObject.HourViewObject(
                                time: "3:00am",
                                temperature: "13 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "6:00am",
                                temperature: "14 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "9:00am",
                                temperature: "15 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                        ]
                    ),
                    HomeViewObject.DateViewObject(
                        date: "15/03",
                        hours: [
                            HomeViewObject.HourViewObject(
                                time: "3:00am",
                                temperature: "13 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "6:00am",
                                temperature: "14 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "9:00am",
                                temperature: "15 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                        ]
                    ),
                ]
            )
        )
    }
}
