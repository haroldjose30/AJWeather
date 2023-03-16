//
//  HomePageViewModel.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import Foundation
import AJDomain
import Combine

public protocol HomeViewModelType: ObservableObject {
    var viewState: ViewStateBase<HomeViewObject> { get set }
    func loadData()
}

public class HomeViewModel: HomeViewModelType,ObservableObject {
    
    @Published public var viewState: ViewStateBase<HomeViewObject> = .idle
    private let getWeatherByCityUseCase: GetForecastUseCaseType
    private var cancellables: Set<AnyCancellable> = []
    private let latitude: Float = 40.64
    private let longitude: Float = -8.64
    
    public init(
        getWeatherByCityUseCase: GetForecastUseCaseType
    ) {
        self.getWeatherByCityUseCase = getWeatherByCityUseCase
    }
    
    public func loadData() {
        viewState = .loading
        
        getWeatherByCityUseCase
            .execute(
                latitude: latitude,
                longitude: longitude
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
