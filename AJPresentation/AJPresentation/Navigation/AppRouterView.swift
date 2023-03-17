//
//  AppRouterView.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

import SwiftUI
import AJDependencyInjection
import AJDomain

public struct AppRouterView: View {
    
    @AJInjected var homeViewModel: HomeViewModel
    
    @EnvironmentObject private var appRouter: AppRouterState
    
    public init(){}
   
    public var body: some View {        
        
        switch appRouter.currentPage {
        case .homePage:
           HomePage(viewModel: homeViewModel)
        case .cityDetailPage(let city):
            CityDetailPagePrepared(city: city)
        }
    }
    
    private struct CityDetailPagePrepared: View {
        
        @AJInjected var cityDetailViewModel: CityDetailViewModel
        let city: CityModel
        init(city: CityModel) {
            self.city = city
            cityDetailViewModel.city = city
        }
        
        var body: some View {
            CityDetailPage(viewModel: cityDetailViewModel)
        }
    }
}
