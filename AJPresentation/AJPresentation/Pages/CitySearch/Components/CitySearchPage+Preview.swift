//
//  CitySearchPage+Preview.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

import Combine
import AJDomain

extension CitySearchPage_Previews {
    
    final class FakeCitySearchViewModel: CitySearchViewModelType, ObservableObject {
        
        @Published var viewStateForRemote: ViewState<[CityModel]> = .idle
        @Published var viewStateForCache: ViewState<[CityModel]> = .idle
        
        private var citiesFromRemote: [CityModel] = []
        private var citiesFromCache: [CityModel] = []
        
        func getCityByNameFromRemote(
            name: String
        ) {
            
            guard !name.isEmpty else {
                viewStateForRemote = .success(data: citiesFromRemote)
                return
            }
            
            viewStateForRemote = .loading
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                
                Task {
                    self.citiesFromRemote = await self.fakeUseCaseGetCitiesFromRemote().filter({ city in
                        city.name
                            .lowercased()
                            .contains(name.lowercased())
                    })
                    self.viewStateForRemote = .success(data: self.citiesFromRemote)
                }
            }
        }
        
        func getCityByNameFromCache(
            name: String
        ) {
            
            guard !name.isEmpty else {
                getAllCitiesFromCache()
                return
            }
            
            
            citiesFromCache = fakeUseCaseGetCitiesFromCache().filter({ city in
                city.name
                    .lowercased()
                    .contains(name.lowercased())
            })
            viewStateForCache = .success(data: citiesFromCache)
        }
        
        func getAllCitiesFromCache() {
            
            if citiesFromCache.count == 0 {
                viewStateForCache = .loading
                citiesFromCache = fakeUseCaseGetCitiesFromCache()
            }
            
            viewStateForCache = .success(data: citiesFromCache)
        }
        
        private func fakeUseCaseGetCitiesFromRemote() -> [CityModel] {
            return [
                CityModel(
                    id: "1",
                    name: "Saint Just Desvern",
                    latitude: 0,
                    longitude: 0,
                    country: "SP",
                    population: 0,
                    sunrise: 0,
                    sunset: 0
                ),
                CityModel(
                    id: "2",
                    name: "Saint Jean",
                    latitude: 0,
                    longitude: 0,
                    country: "FR",
                    population: 0,
                    sunrise: 0,
                    sunset: 0
                ),
                CityModel(
                    id: "3",
                    name: "Saint Anna",
                    latitude: 0,
                    longitude: 0,
                    country: "BR",
                    population: 0,
                    sunrise: 0,
                    sunset: 0
                )
            ]
        }
        
        private func fakeUseCaseGetCitiesFromCache() -> [CityModel] {
            return [
                CityModel(
                    id: "2",
                    name: "Lisboa",
                    latitude: 0,
                    longitude: 0,
                    country: "PT",
                    population: 0,
                    sunrise: 0,
                    sunset: 0
                ),
                CityModel(
                    id: "3",
                    name: "Ovar",
                    latitude: 0,
                    longitude: 0,
                    country: "PT",
                    population: 0,
                    sunrise: 0,
                    sunset: 0
                ),
                CityModel(
                    id: "4",
                    name: "Coimbra",
                    latitude: 0,
                    longitude: 0,
                    country: "PT",
                    population: 0,
                    sunrise: 0,
                    sunset: 0
                ),
                CityModel(
                    id: "5",
                    name: "São Paulo",
                    latitude: 0,
                    longitude: 0,
                    country: "BR",
                    population: 0,
                    sunrise: 0,
                    sunset: 0
                )
            ]
        }
    }
}

