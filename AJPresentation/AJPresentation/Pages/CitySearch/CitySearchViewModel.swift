//
//  CitySearchViewModel.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

import Combine
import AJDomain
import AJData

final class CitySearchViewModel: CitySearchViewModelType, ObservableObject {
    
    private var getCitiesByNameUseCase: GetCitiesByNameUseCaseType
    private var cancellables: Set<AnyCancellable> = []
    
    public init(
        getCitiesByNameUseCase: GetCitiesByNameUseCaseType
    ) {
        self.getCitiesByNameUseCase = getCitiesByNameUseCase
    }
    
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
        
        getCitiesByNameUseCase
            .execute(
                name: name,
                from: DataSourceOrigin.remote
            )
            .sink(
                receiveCompletion: {  [weak self] completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure:
                        self?.viewStateForRemote = .failed(message: nil,action: nil)
                    }
                },
                receiveValue: {  [weak self] citiesModel in
                    self?.citiesFromRemote = citiesModel
                    self?.viewStateForRemote = .success(
                        data: citiesModel
                    )
                }
            ).store(in: &self.cancellables)
    }
    
    func getCityByNameFromCache(
        name: String
    ) {
        
        guard !citiesFromCache.isEmpty else {
            getAllCitiesFromCache()
            return
        }
        
        viewStateForCache = .success(
            data: citiesFromCache
                .filter({
                    $0.name
                        .lowercased()
                        .contains(name.lowercased())
                })
        )
    }
    
    private func getAllCitiesFromCache() {
        
        guard citiesFromCache.isEmpty else {
            viewStateForCache = .success(data: citiesFromCache)
            return
        }
        
        viewStateForCache = .loading
        getCitiesByNameUseCase
            .execute(
                name: "",
                from: DataSourceOrigin.local
            )
            .sink(
                receiveCompletion: {  [weak self] completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure:
                        self?.viewStateForCache = .failed(message: nil,action: nil)
                    }
                },
                receiveValue: {  [weak self] citiesModel in
                    self?.citiesFromCache = citiesModel
                    self?.viewStateForCache = .success(
                        data: citiesModel
                    )
                }
            ).store(in: &self.cancellables)
    }
}
