//
//  SuccessView+RowView.swift
//  AJPresentation
//
//  Created by Jose Harold on 13/03/2023.
//

import SwiftUI

extension HomeSuccessView {
    
    struct RowView: View {
        
        let hour: HomeViewObject.HourViewObject
        var body: some View {
            
            HStack {
                ImageView(imageUrl: hour.iconUrl)
                
                VStack {
                    Text(hour.time)
                        .font(.callout)
                        .padding(.bottom,4)
                    Text(hour.desc)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(hour.temperature)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct HomeSuccessView_RowView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeSuccessView.RowView(
            hour: HomeViewObject.HourViewObject(
                time: "3:00am",
                temperature: "13 °C",
                iconUrl: "https://openweathermap.org/img/wn/10d@2x.png",
                description: "Clear Sky"
            )
        )
    }
}
