//
//  CityDetailPage.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

import Foundation
import SwiftUI
import AJDomain
import MapKit


public struct CityDetailPage<ViewModel>: View where ViewModel: CityDetailViewModelType {
    
    @StateObject var viewModel: ViewModel
    @State private var bottonSheetIsPresented = false
    
    public init(
        viewModel: ViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        
        VStack{
            HeaderView(
                city: viewModel.city,
                isPresented: $bottonSheetIsPresented
            )
            Map(
                coordinateRegion: $viewModel.mapRegion,
                annotationItems: viewModel.locations
            ) { location in
                MapMarker(coordinate: location.coordinate)
            }
        }.edgesIgnoringSafeArea(.bottom)
            .sheet(isPresented: $bottonSheetIsPresented) {
                
                SheetView(city: viewModel.city)
                    .presentationDetents([.fraction(0.35),.medium])
                    .presentationDragIndicator(.visible)
                
            }
    }
    
    private struct HeaderView: View {
        
        let city: CityModel
        @Binding var isPresented: Bool
        var body: some View {
            
            ZStack {
                
                VStack {
                    Text("\(city.name),\(city.country)")
                        .font(.title)
                    Text("\(city.latitude) , \(city.longitude)")
                        .font(.caption)
                }
                
                HStack {
                    Spacer()
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "info.bubble.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30,height:30)
                        
                    }
                }.padding(EdgeInsets(top: 0,leading: 16,bottom: 0,trailing: 32))
                
            }
        }
    }
    
    private struct SheetView: View {
        
        let city: CityModel
        var body: some View {
            List {
                
                Section(header:Text("Population")) {
                    RowView(infoDetail: "\(city.population)", icon: "figure.2.and.child.holdinghands")
                }
                
                Section(header:Text("Sunrise & Sunset")) {
                    RowView(infoDetail: "\(city.sunrise.toDate().formatterToTime())", icon: "sunrise.fill")
                    RowView(infoDetail: "\(city.sunset.toDate().formatterToTime())", icon: "sunset.fill")
                }
            }
        }
    }
    
    private struct RowView: View {
        
        let infoDetail: String
        let icon: String
        
        var body: some View {
            
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
                    .frame(width: 30,height:30)
                Text(infoDetail)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
    
}

struct CityDetailPage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CityDetailPage(
            viewModel:
                CityDetailViewModel(
                    city: CityModel(
                        id: "2742611",
                        name: "Aveiro",
                        latitude: 40.64,
                        longitude: -8.64,
                        country: "PT",
                        population: 54162,
                        sunrise: 1679035421,
                        sunset: 1679078546
                    )
                )
            
        )
    }
}
