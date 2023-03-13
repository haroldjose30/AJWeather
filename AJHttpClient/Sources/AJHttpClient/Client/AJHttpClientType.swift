//
//  AJHttpClientType.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

import Foundation

public protocol AJHttpClientType {
    
    func send<T: AJHttpRequest>(_ request: T) -> AJHttpResponse<T>
}
