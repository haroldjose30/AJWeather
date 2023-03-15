//
//  GetWeatherByCityUseCase.swift
//  AJDomain
//
//  Created by Jose Harold on 13/03/2023.
//

import Combine

final class GetWeatherByCityUseCase: GetWeatherByCityUseCaseType {
    
    //TODO: add DI
    private var repository: FakeRepository = FakeRepository()
    
    private let scheduler: SchedulerType
   
    public init(
        scheduler: SchedulerType
    ) {
        self.scheduler = scheduler
    }
    
    public func execute(
        city: String,
        country: String
    ) -> AnyPublisher<ForecastModel, Error> {
        
        return repository
            .GetWeatherByCity(
                city: city,
                country: country
            )
            .map { forecastDTO -> ForecastModel in
                //TODO: map DTO to Model
                return self.getFakeForecastModel()
            }
            .subscribe(on: scheduler.execution)
            .receive(on: scheduler.postExecution)
            .eraseToAnyPublisher()
    }
    
    private func getFakeForecastModel() -> ForecastModel {
        
        let today = Date()
        let dateComponent = DateComponents(day: 1)
        let hourComponent = DateComponents(hour: 3)
        
        let todayPlus3 = Calendar.current.date(byAdding: hourComponent, to: today)!
        let todayPlus6 = Calendar.current.date(byAdding: hourComponent, to: todayPlus3)!
        let todayPlus9 = Calendar.current.date(byAdding: hourComponent, to: todayPlus6)!
        
        let tomorow = Calendar.current.date(byAdding: dateComponent, to: today)!
        let afterTomorow = Calendar.current.date(byAdding: dateComponent, to: tomorow)!
        
        
        return ForecastModel(
            city: CityModel(
                id: 0,
                name: "Aveiro",
                coord: CoordinateModel(
                    latitude: 0,
                    longitude: 0
                ),
                country: "PT"
            ),
            list: [
                ForecastModel.Detail(
                    date: today,
                    dateTxt: "\(today)",
                    main: ForecastModel.TemperatureDetail(
                        temperature: 13.76,
                        feelsLike: 1,
                        tempMin: 1,
                        tempMax: 1,
                        humidity: 1
                    ),
                    weather: [
                        WeatherModel(
                            id: 500,
                            main: "Rain",
                            description: "light rain",
                            icon: "10d"
                        )
                    ]
                ),
                ForecastModel.Detail(
                    date: todayPlus3,
                    dateTxt: "\(todayPlus3)",
                    main: ForecastModel.TemperatureDetail(
                        temperature: 14.01,
                        feelsLike: 1,
                        tempMin: 1,
                        tempMax: 1,
                        humidity: 1
                    ),
                    weather: [
                        WeatherModel(
                            id: 500,
                            main: "Rain",
                            description: "light rain",
                            icon: "10d"
                        )
                    ]
                ),
                ForecastModel.Detail(
                    date: todayPlus6,
                    dateTxt: "\(todayPlus6)",
                    main: ForecastModel.TemperatureDetail(
                        temperature: 18.0,
                        feelsLike: 1,
                        tempMin: 1,
                        tempMax: 1,
                        humidity: 1
                    ),
                    weather: [
                        WeatherModel(
                            id: 500,
                            main: "Rain",
                            description: "light rain",
                            icon: "10d"
                        )
                    ]
                ),
                ForecastModel.Detail(
                    date: todayPlus9,
                    dateTxt: "\(todayPlus9)",
                    main: ForecastModel.TemperatureDetail(
                        temperature: 21.1,
                        feelsLike: 1,
                        tempMin: 1,
                        tempMax: 1,
                        humidity: 1
                    ),
                    weather: [
                        WeatherModel(
                            id: 500,
                            main: "Rain",
                            description: "light rain",
                            icon: "10d"
                        )
                    ]
                ),
                ForecastModel.Detail(
                    date: tomorow,
                    dateTxt: "\(tomorow)",
                    main: ForecastModel.TemperatureDetail(
                        temperature: 23.4,
                        feelsLike: 1,
                        tempMin: 1,
                        tempMax: 1,
                        humidity: 1
                    ),
                    weather: [
                        WeatherModel(
                            id: 801,
                            main: "Clouds",
                            description: "few clouds",
                            icon: "02d"
                        )
                    ]
                ),
                ForecastModel.Detail(
                    date: afterTomorow,
                    dateTxt: "\(afterTomorow)",
                    main: ForecastModel.TemperatureDetail(
                        temperature: 17.9,
                        feelsLike: 1,
                        tempMin: 1,
                        tempMax: 1,
                        humidity: 1
                    ),
                    weather: [
                        WeatherModel(
                            id: 0,
                            main: "Clouds",
                            description: "overcast clouds",
                            icon: "04d"
                        )
                    ]
                )
                
            ]
        )
    }
}


private class FakeRepository {
    
    func GetWeatherByCity(
        city: String,
        country: String
    ) -> Future<ForecastDTO, Error> {
        
        return .init { promise in
            promise(.success(ForecastDTO(fake: "fake")))
        }
    }
}

private struct ForecastDTO {
    var fake: String
}
