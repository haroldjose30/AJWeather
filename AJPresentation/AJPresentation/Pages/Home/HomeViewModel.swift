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
    private let getWeatherByCityUseCase: GetWeatherByCityUseCaseType
    private var cancellables: Set<AnyCancellable> = []
    private let city: String = "Aveiro"
    private let country: String = "PT"
    
    
    public init(
        getWeatherByCityUseCase: GetWeatherByCityUseCaseType
    ) {
        self.getWeatherByCityUseCase = getWeatherByCityUseCase
    }
    
    public func loadData() {
        viewState = .loading
        
        getWeatherByCityUseCase
            .execute(
                city: city,
                country: country
            )
            .sink(
                receiveCompletion: {  [weak self] completion in
                    switch completion {
                    case .finished: do {}
                    case .failure: do {
                        
                        self?.viewState = .failed(
                            action: { [weak self] in
                                self?.loadData()
                            }
                        )
                    }
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
