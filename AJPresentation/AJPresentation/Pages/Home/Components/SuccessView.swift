//
//  SuccessView.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI
import AJDomain

extension HomePage {
    
    struct SuccessView: View {
        
        let data: HomeViewObject
        
        var body: some View {
            
            VStack {
                Text(data.title)
                    .font(.largeTitle)
                
                ListView(
                    dates: data.dates
                )
            }
        }
    }
}

private struct ListView: View {
    
    let dates: [HomeViewObject.DateViewObject]
    var body: some View {
        
        List(dates, id: \.date) { dateGroup in
            Section(header: SectionView(text: dateGroup.date)) {
                RowListView(hours: dateGroup.hours)
            }
        }.listStyle(.insetGrouped)
    }
}


private struct SectionView: View {
    
    let text: String
    var body: some View {
        
        HStack {
            Spacer()
            Text(text)
                .font(.title)
            Spacer()
        }
    }
}

private struct RowListView: View {
    
    let hours: [HomeViewObject.HourViewObject]
    var body: some View {
        
        ForEach(hours, id: \.time) { hourDetail in
            RowView(hour: hourDetail)
        }
    }
}

private struct RowView: View {
    
    let hour: HomeViewObject.HourViewObject
    var body: some View {
        
        HStack {
            ImageView(imageUrl: hour.iconUrl)
            
            VStack {
                Text(hour.time)
                    .font(.callout)
                Text(hour.description)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(hour.temperature)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomePage.SuccessView(
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
