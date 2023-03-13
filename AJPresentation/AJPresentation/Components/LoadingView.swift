//
//  LoadingView.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 8){
            ProgressView()
            Text(Localizable.loading)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
