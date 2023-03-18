//
//  CitySearchViewModelType.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

import Combine
import AJDomain

public protocol CitySearchViewModelType: ObservableObject {
    
    var viewStateForRemote: ViewState<[CityModel]> { get }
    var viewStateForCache: ViewState<[CityModel]> { get }
    func getCityByNameFromRemote(name: String)
    func getCityByNameFromCache(name: String)
}
