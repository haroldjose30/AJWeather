//
//  AJHttpClient.swift
//
//
//  Created by Jose Harold on 13/03/2023.
//

import Foundation

public class AJHttpClient {
    
    public let session: URLSession
    
    public init(
        session: URLSession = URLSession.shared
    ) {
        self.session = session
    }
}

extension AJHttpClient: AJHttpClientType {
    
    public func send<T: AJHttpRequest>(_ request: T) -> AJHttpResponse<T> {
        
        return AJHttpResponse(
            session: session,
            request: request
        )
    }
}
