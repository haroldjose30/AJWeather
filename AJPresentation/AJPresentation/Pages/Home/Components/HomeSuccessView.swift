//
//  SuccessView.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI
import AJDependencyInjection
import AJDomain

struct HomeSuccessView: View {
   
    let city: CityModel
    let data: HomeViewObject
    let reloadAction: () -> Void
    
    init(
        city: CityModel,
        data: HomeViewObject,
        reloadAction: @escaping () -> Void
    ) {
        self.data = data
        self.reloadAction = reloadAction
        self.city = city
    }
    
   
    
    var body: some View {
        
        NavigationView  {
            VStack {
                
                ZStack {
                    
                    VStack {
                        Text(data.title)
                            .font(.title)
                    }
                    
                    HStack {
                        Spacer()
                        NavigationLink(destination: CityDetailPage(viewModel: CityDetailViewModel(city: city))) {
                            Image(systemName: "map")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30,height:30)
                        }
                    }.padding(EdgeInsets(top: 0,leading: 16,bottom: 0,trailing: 32))
                    
                }
                
                if data.dates.isEmpty {
                    EmptyDateView(reloadAction:reloadAction)
                } else {
                    List(data.dates, id: \.date) { dateGroup in
                        Section(header: SectionView(text: dateGroup.date)) {
                            SectionListView(
                                hours: dateGroup.hours
                            )
                        }
                    }.listStyle(.insetGrouped)
                    
                    Button(Localizable.reload) {
                        reloadAction()
                    }
                }
                
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
        let reloadAction: () -> Void
        var body: some View {
            VStack {
                Spacer()
                Text(Localizable.emptyDate)
                    .font(.title2)
                
                Button(Localizable.reload) {
                    reloadAction()
                }
                
                Spacer()
            }
        }
    }
}

struct HomeSuccessView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeSuccessView(
            city: CityModel(
                id: "",
                name: "",
                latitude: 0,
                longitude: 0,
                country: "",
                population: 0,
                sunrise: 0,
                sunset: 0)
            ,
            data: HomeViewObject(
                city: CityModel(
                    id: "2742611",
                    name: "Aveiro",
                    latitude: 40.64,
                    longitude: -8.64,
                    country: "PT",
                    population: 54162,
                    sunrise: 1679035421,
                    sunset: 1679078546
                ),
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
            ),
            reloadAction: {}
        )
    }
}
