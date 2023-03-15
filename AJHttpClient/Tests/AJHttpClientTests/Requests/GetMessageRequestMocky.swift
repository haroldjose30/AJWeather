//
//  GetMessageRequestMocky.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

@testable import AJHttpClient

struct GetMessageRequestMocky: AJHttpRequestGetJson {
    typealias ResponseType = MessageDTO
    var queryParameters: AJHttpQueryParameters = [:]
    var urlBase: String
    var path: String
    var headers: AJHttpHeaders = [:]
    
    init(path: String) {
        self.headers = ["Content-Type": "application/json"]
        self.urlBase = MockyEndpoint.baseUrl
        self.path = path
    }
}

struct MessageDTO: Decodable {
    var message: String
}
