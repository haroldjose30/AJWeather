//
//  SectionView.swift
//  AJPresentation
//
//  Created by Jose Harold on 13/03/2023.
//

import SwiftUI
extension HomeSuccessView {
    
    struct SectionView: View {
        
        let text: String
        var body: some View {
            
            HStack {
                Spacer()
                Text(text)
                    .font(.title)
                Spacer()
            }
        }
    }    
}


struct HomeSuccessView_SectionView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSuccessView.SectionView(
            text: "Today"
        )
    }
}
