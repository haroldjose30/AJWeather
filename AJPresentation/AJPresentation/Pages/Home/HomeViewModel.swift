//
//  HomePageViewModel.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import Foundation
import AJDomain
import Combine

public class HomeViewModel: HomeViewModelType,ObservableObject {
    
    @Published public var viewState: ViewState<HomeViewObject> = .idle
    private let getForecastUseCase: GetForecastUseCaseType
    private var cancellables: Set<AnyCancellable> = []
    
    //Todo: get current position from user - Default Aveiro,PT
    private var latitudeDefault: Float = 40.64
    private var longitudeDefault: Float = -8.64
    
    var city: CityModel? {
        didSet {
            if let city {
                latitudeDefault = city.latitude
                longitudeDefault = city.longitude
            }
        }
    }
    
    public init(
        getForecastUseCase: GetForecastUseCaseType
    ) {
        self.getForecastUseCase = getForecastUseCase
    }
    
    public func loadData() {
        
        viewState = .loading        
        getForecastUseCase
            .execute(
                latitude: latitudeDefault,
                longitude: longitudeDefault
            )
            .sink(
                receiveCompletion: {  [weak self] completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure:
                        self?.viewState = .failed(
                            action: { [weak self] in
                                self?.loadData()
                            }
                        )
                    }
                },
                receiveValue: {  [weak self] forecastModel in
                    
                    let homeViewObject = forecastModel.mapToHomeViewObject()
                    
                    self?.viewState = .success(
                        data: homeViewObject
                    )
                }
            ).store(in: &self.cancellables)
    }
}
