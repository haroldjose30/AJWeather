//
//  FailedView.swift
//  AJPresentation
//
//  Created by Jose Harold on 12/03/2023.
//

import SwiftUI

struct FailedView: View {
    var message: String = "oops something went wrong."
    var body: some View {
        Text(message)
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
