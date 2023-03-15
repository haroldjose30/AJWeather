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
                        SectionListView(
                            hours: dateGroup.hours
                        )
                    }
                }.listStyle(.insetGrouped)
            }
            
        }
    }
    
    private struct SectionListView: View {
        var hours: [HomeViewObject.HourViewObject]
        
        @State private var rowsShowed = 3
        private let rowsIncrement = 3
        
        var body: some View {
            ForEach(hours.prefix(rowsShowed), id: \.time) { hourDetail in
                HomeSuccessView.RowView(hour: hourDetail)
            }
            
            ShowMoreRowView(
                rowsTotal: hours.count,
                rowsShowed: rowsShowed
            ) {
                rowsShowed += rowsIncrement
            }
        }
    }
    
    private struct ShowMoreRowView: View {
        
        let rowsTotal: Int
        let rowsShowed: Int
        let action: () -> Void
        
        var body: some View {
            
            if rowsTotal > rowsShowed {
                HStack{
                    Spacer()
                    Button(action: action) {
                        Text("show more \(rowsTotal - rowsShowed)")
                    }
                    Spacer()
                }
            } else {
                EmptyView()
            }
            
        }
    }
    
    private struct EmptyDateView: View {
        
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
                            HomeViewObject.HourViewObject(
                                time: "12:00pm",
                                temperature: "16 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
                                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                                description: "Clear Sky"
                            ),
                            HomeViewObject.HourViewObject(
                                time: "3:00pm",
                                temperature: "18 °C",
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
