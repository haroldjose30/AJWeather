//
//  ImageView.swift
//  AJPresentation
//
//  Created by Jose Harold on 13/03/2023.
//

import SwiftUI

struct ImageView: View {
    
    var imageUrl: String
    var maxWidth: CGFloat = 50
    var maxHeight: CGFloat = 50
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: maxWidth, maxHeight: maxHeight)
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(
            imageUrl: "https://openweathermap.org/img/wn/10d@2x.png"
        )
    }
}
