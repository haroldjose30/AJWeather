//
//  AJHttpRequestGet.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

import Foundation

public typealias AJHttpQueryParameters = [String: String]

public protocol AJHttpRequestGet: AJHttpRequest {
    var queryParameters: AJHttpQueryParameters { get }
}

public extension AJHttpRequestGet {
    var method: AJHttpMethod { return .get  }
    var urlRequest: URLRequest? {
        
        var query = ""
        if !queryParameters.isEmpty {
            query = queryParameters.reduce("?") { total, item in
                return total == "?" ? "\(total)\(item.key)=\(item.value)" : "\(total)&\(item.key)=\(item.value)"
            }
        }
        
        guard let url = URL(string: urlBase + path + query) else { return nil }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        request.httpMethod = method.rawValue
        request.cachePolicy = cachePolicy
        headers.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
}
