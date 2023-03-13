//
//  AJHttpRequest.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

import Foundation

public typealias AJHttpHeaders = [String: String]

public protocol AJHttpRequest {
    var urlBase: String { get }
    var path: String { get }
    var headers: AJHttpHeaders { get set }
    var method: AJHttpMethod { get }
    var urlRequest: URLRequest? { get }
}

extension AJHttpRequest {
    public var cachePolicy: URLRequest.CachePolicy { .reloadRevalidatingCacheData }
}
