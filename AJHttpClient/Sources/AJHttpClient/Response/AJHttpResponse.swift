//
//  AJHttpResponse.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

import Foundation

public class AJHttpResponse<T> where T: AJHttpRequest {
    var session: URLSession
    var request: T
    
    init(
        session: URLSession,
        request: T
    ) {
        self.session = session
        self.request = request
    }
}
