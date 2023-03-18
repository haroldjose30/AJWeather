//
//  HomePage.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import Foundation
import SwiftUI
import AJDependencyInjection

public struct HomePage<ViewModel>: View where ViewModel: HomeViewModelType {
    
    @StateObject var viewModel: ViewModel
    
    public init(
        viewModel: ViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        
        Group {
            switch viewModel.viewState {
            case .idle:
                Text("AJWeather")
            case .loading:
                LoadingView()
            case let .failed(message,action):
                FailedView(
                    message: message,
                    action: action
                )
            case .success(let data):
                HomeSuccessView(
                    city: data.city,
                            homeViewObject: data,
                    reloadAction: {
                        viewModel.loadData()
                    }
                )
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomePage(
            viewModel: FakeHomeViewMode()
        )
        .previewDisplayName("Default")
        
        HomePage(
            viewModel: FakeHomeViewModeWithEmptyDate()
        )
        .previewDisplayName("EmptyDate")
        
        HomePage(
            viewModel: FakeHomeViewModeWithError()
        )
        .previewDisplayName("Error")
        
        HomePage(
            viewModel: FakeHomeViewModeWithIdle()
        )
        .previewDisplayName("Idle")
    }
}
