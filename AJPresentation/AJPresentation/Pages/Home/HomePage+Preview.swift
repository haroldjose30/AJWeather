//
//  HomePage+PreviewProviders.swift
//  AJPresentation
//
//  Created by Jose Harold on 13/03/2023.
//

import AJDomain
import Combine

extension HomePage_Previews {
    
    final class FakeHomeViewMode: HomeViewModelType {
        
        var viewState: ViewState<HomeViewObject> = .success(data: getFakeData())
        func loadData() {}
    }
    
    final class FakeHomeViewModeWithEmptyDate: HomeViewModelType {
        
        var viewState: ViewState<HomeViewObject> = .success(data: getFakeDataWithEmptyDate())
        func loadData() {}
    }
    
    final class FakeHomeViewModeWithError: HomeViewModelType {
        
        var viewState: ViewState<HomeViewObject> = .failed(message: nil, action: {})
        func loadData() {}
    }
    
    final class FakeHomeViewModeWithIdle: HomeViewModelType {
        
        var viewState: ViewState<HomeViewObject> = .idle
        func loadData() {}
    }
    
    private static func getFakeData() -> HomeViewObject {
        HomeViewObject(
            city: CityModel(
                id: "",
                name: "",
                latitude: 0,
                longitude: 0,
                country: "",
                population: 0,
                sunrise: 0,
                sunset: 0
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
    }
    
    private static func getFakeDataWithEmptyDate() -> HomeViewObject {
        HomeViewObject(
            city: CityModel(
                id: "",
                name: "",
                latitude: 0,
                longitude: 0,
                country: "OT",
                population: 0,
                sunrise: 0,
                sunset: 0
            ),
            title: "Aveiro,PT",
            dates: []
        )
    }
}
