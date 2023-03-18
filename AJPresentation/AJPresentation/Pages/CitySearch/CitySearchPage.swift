//
//  CitySearchPage.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

import SwiftUI
import AJDomain


public struct CitySearchPage<ViewModel>: View where ViewModel: CitySearchViewModelType {
    
    @StateObject var viewModel: ViewModel
    @State private var queryFilter = ""
    @EnvironmentObject private var appRouter: AppRouterState
    
    public init(
        viewModel: ViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationView {
            
            List {
                SessionListView(
                    title: "Cities from your search",
                    queryFilter: queryFilter,
                    viewState: viewModel.viewStateForRemote
                )
                SessionListView(
                    title: "Cities Stored in your app",
                    queryFilter: queryFilter,
                    viewState: viewModel.viewStateForCache
                )
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Cities")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        appRouter.currentPage = .homePage(city: nil)
                    } label: {
                        Image(systemName: "chevron.backward")
                    }
                }
            }
        }
        .onAppear {
            viewModel.getCityByNameFromCache(name: "")
        }
        .searchable(
            text: $queryFilter,
            prompt: "The weather in..."
        )
        .onSubmit(of: .search) {
            viewModel.getCityByNameFromRemote(name: queryFilter)
        }
        .onChange(of: queryFilter) { query in
            viewModel.getCityByNameFromCache(name: query)
        }
        
    }
}

struct CitySearchPage_Previews: PreviewProvider {
    static var previews: some View {
        CitySearchPage(
            viewModel: FakeCitySearchViewModel()
        ).environmentObject(AppRouterState())
    }
}
