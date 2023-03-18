//
//  AppRouterView.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

import SwiftUI
import AJDependencyInjection
import AJDomain


///Note: For this project I used a very simplest router to finished the project, in a real project I´ll prefer to
///use Coordinator Pattern with UIKit and avoid to use NavigationView from SwiftUI.
public struct AppRouterView: View {
    
    @EnvironmentObject private var appRouter: AppRouterState
    
    public init(){}
   
    public var body: some View {        
        
        switch appRouter.currentPage {
            
        case .homePage(let city):
          GoToHomePage(city: city)
            
        case .cityDetailPage(let city):
            GoToCityDetailPage(city: city)
            
        case .citySearchPage:
            GoToCitySearchPage()
        }
    }
    
    private struct GoToHomePage: View {
        
        @AJInjected var viewModel: HomeViewModel
        
        init(city: CityModel?) {
            if let city {
                viewModel.city = city
            }
        }
        
        var body: some View {
            HomePage(viewModel: viewModel)
        }
    }
    
    private struct GoToCityDetailPage: View {
        
        @AJInjected var viewModel: CityDetailViewModel
        
        init(city: CityModel) {
            viewModel.city = city
        }
        
        var body: some View {
            CityDetailPage(viewModel: viewModel)
        }
    }
    
    private struct GoToCitySearchPage: View {
        
        @AJInjected var viewModel: CitySearchViewModel
        
        var body: some View {
            CitySearchPage(viewModel: viewModel)
        }
    }
}
