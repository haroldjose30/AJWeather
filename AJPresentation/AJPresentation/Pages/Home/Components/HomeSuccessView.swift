//
//  SuccessView.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI
import AJDependencyInjection
import AJDomain

struct HomeSuccessView: View {
    
    let city: CityModel
    let homeViewObject: HomeViewObject
    let reloadAction: () -> Void
    
    init(
        city: CityModel,
        homeViewObject: HomeViewObject,
        reloadAction: @escaping () -> Void
    ) {
        self.homeViewObject = homeViewObject
        self.reloadAction = reloadAction
        self.city = city
    }
    
    var body: some View {
        
        VStack {
            
            HeaderView(
                title: homeViewObject.title,
                city: city
            )
            
            if homeViewObject.dates.isEmpty {
                EmptyDateView(reloadAction:reloadAction)
            } else {
                List(homeViewObject.dates, id: \.date) { dateGroup in
                    Section(header: SectionView(text: dateGroup.date)) {
                        SectionListView(
                            hours: dateGroup.hours
                        )
                    }
                }.listStyle(.insetGrouped)
            }
        }
    }
    
    private struct HeaderView: View {
        
        let title: String
        let city: CityModel
        @EnvironmentObject private var appRouter: AppRouterState
        
        var body: some View {
            HStack {
                Button(action: {
                    appRouter.currentPage = .citySearchPage
                }) {
                    Image(systemName: "magnifyingglass")
                    
                    Text(title)
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                Spacer()
                Button(action: {
                    appRouter.currentPage = .cityDetailPage(city:city)
                }) {
                    Image(systemName: "map")
                }
            }.padding(EdgeInsets(top: 0,leading: 16,bottom: 0,trailing: 16))
        }
    }
    
    private struct SectionListView: View {
        
        var hours: [HomeViewObject.HourViewObject]
        
        @State private var rowsShowed = 3
        private let rowsIncrement = 3
        
        var body: some View {
            ForEach(hours.prefix(rowsShowed), id: \.time) { hourDetail in
                HomeSuccessView.RowView(hour: hourDetail)
            }
            
            ShowMoreRowView(
                rowsTotal: hours.count,
                rowsShowed: rowsShowed
            ) {
                rowsShowed += rowsIncrement
            }
        }
    }
    
    private struct ShowMoreRowView: View {
        
        let rowsTotal: Int
        let rowsShowed: Int
        let action: () -> Void
        
        var body: some View {
            
            if rowsTotal > rowsShowed {
                HStack{
                    Spacer()
                    Button(action: action) {
                        Text("show more \(rowsTotal - rowsShowed)")
                    }
                    Spacer()
                }
            } else {
                EmptyView()
            }
            
        }
    }
    
    private struct EmptyDateView: View {
        let reloadAction: () -> Void
        var body: some View {
            VStack {
                Spacer()
                Text(Localizable.emptyDate)
                    .font(.title2)
                
                Button(Localizable.reload) {
                    reloadAction()
                }
                
                Spacer()
            }
        }
    }
}

struct HomeSuccessView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let city = CityModel(
            id: "2742611",
            name: "Aveiro",
            latitude: 40.64,
            longitude: -8.64,
            country: "PT",
            population: 54162,
            sunrise: 1679035421,
            sunset: 1679078546
        )
        
        
        return HomeSuccessView(
            city: city,
            homeViewObject: HomeViewObject(
                city: city,
                title: "Aveiro,PT",
                dates: fakeDates
            ),
            reloadAction: {}
        )
        .environmentObject(AppRouterState())
    }
}
