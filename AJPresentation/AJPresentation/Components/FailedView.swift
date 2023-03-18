//
//  FailedView.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI

struct FailedView: View {
    var message: String? = nil
    var action: (()-> Void)? = nil
    var body: some View {
        VStack {
            Text(message ?? Localizable.genericError)
                .foregroundColor(.red)
            if let action = action {
                Button(Localizable.retry) {
                    action()
                }
            }
        }
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        
        FailedView()
            .previewDisplayName("Default")
        
        
        FailedView(
            message: "Custom error message"
        )
        .previewDisplayName("With Message")
        
        
        FailedView(
            message: "Custom error message",
            action: {}
        )
        .previewDisplayName("With Button")
    }
}
