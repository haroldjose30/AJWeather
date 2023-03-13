//
//  HomePage.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI
import AJDomain

struct HomePage: View {
    
    //TODO: add DI
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        switch viewModel.viewState {
        case .initial,.loading:
            LoadingView()
        case .failed:
            FailedView()
        case .success(let data):
            SuccessView(
                data: data
            )
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
