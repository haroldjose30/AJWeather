//
//  SessionListView.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

import SwiftUI
import AJDomain

struct SessionListView: View {
    
    let title: String
    let queryFilter: String
    let viewState: ViewState<[CityModel]>
    @EnvironmentObject private var appRouter: AppRouterState
    
    var body: some View {
        
        Section(header: SessionHeaderView(title: title, viewState: viewState)) {
            switch viewState {
            case .idle,.loading:
                EmptyView()
            case .success(let cities):
                if !queryFilter.isEmpty && cities.count == 0 {
                    Text("Not Found")
                } else {
                    ForEach(cities, id: \.id) { city in
                        Text("\(city.name),\(city.country)")
                            .gesture(TapGesture()
                                .onEnded { _ in
                                    appRouter.currentPage = .homePage(city: city)
                                }
                            )
                    }
                }
            case .failed:
                FailedView()
            }
        }
    }
}

private struct SessionHeaderView: View {
    let title: String
    let viewState: ViewState<[CityModel]>
    var body: some View {
        
        switch viewState {
        case .loading:
            HStack {
                Text(title)
                Spacer()
                ProgressView()
                Spacer()
            }
        default:
            Text(title)
        }
    }
}

struct SessionListView_Previews: PreviewProvider {
    static var previews: some View {
        List{
            SessionListView(
                title: "Session .success",
                queryFilter: "",
                viewState: .success(data: [
                    CityModel(id: "1", name: "City 1", country: "PT"),
                    CityModel(id: "2", name: "City 2", country: "PT"),
                    CityModel(id: "3", name: "City 3", country: "PT")
                    
                ])
            )
            
            SessionListView(
                title: "Session .loading",
                queryFilter: "",
                viewState: .loading
            )
            
            SessionListView(
                title: "Session .success not found",
                queryFilter: "City",
                viewState: .success(data: [])
            )
            
            
            SessionListView(
                title: "Session .idle",
                queryFilter: "",
                viewState: .idle
            )
            
            SessionListView(
                title: "Session .failed",
                queryFilter: "",
                viewState: .failed(message: nil,action: nil)
            )
        }.environmentObject(AppRouterState())
    }
}
