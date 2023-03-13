//
//  AJHttpClientError.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

import Foundation

public enum AJHttpError: Error, Equatable {
    
    case encodingError
    case decodingError(String?)
    case badRequest
    case serverError
    case unauthorized
    case unknown
    case urlMalFormmed
    case forbidden
    case notFound
}
