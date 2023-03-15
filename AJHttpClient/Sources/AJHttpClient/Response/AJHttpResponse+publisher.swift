//
//  File.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

import Foundation
import Combine

extension AJHttpResponse {
    
    func publisher<R>(
        type: R.Type,
        decode: @escaping (Data) throws -> R
    ) -> AnyPublisher<R, AJHttpError> {
        
        guard let urlRequest = request.urlRequest else {
            
            return Fail(error: AJHttpError.urlMalFormmed)
                .eraseToAnyPublisher()
        }
        
        urlRequest.allHTTPHeaderFields?.forEach({ (key: String, value: String) in
            AJHttpLogger.print("headers: \(key)=\(value)")
        })
        
        if let bodyData = urlRequest.httpBody {
            AJHttpLogger.print("body: \(String(data: bodyData, encoding: .utf8) ?? "nil")")
        }
        
        return session
            .dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    AJHttpLogger.print("AJHttpResponse is nil")
                    throw AJHttpError.unknown
                }
                
                AJHttpLogger.print("statusCode: \(httpResponse.statusCode)")
                guard 200..<300 ~= httpResponse.statusCode else {
                    AJHttpLogger.print("response: \(String(data: data, encoding: .utf8) ?? "nil or error")")
                    throw self.mapToHttpError(with: httpResponse.statusCode)
                }
                
                AJHttpLogger.print("response: \(String(data: data, encoding: .utf8) ?? "nil or error")")
                return try decode(data)
            }
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .mapError {
                guard let error = $0 as? AJHttpError else {
                    AJHttpLogger.print("HttpError:\( $0.localizedDescription)")
                    return AJHttpError.unknown
                }
                return error
            }
            .eraseToAnyPublisher()
    }
    
    private func mapToHttpError(
        with code: Int
    ) -> AJHttpError {
        let error: AJHttpError
        switch code {
        case 400:
            error = .badRequest
        case 401:
            error = .unauthorized
        case 403:
            error = .forbidden
        case 404:
            error = .notFound
        case 500:
            error = .serverError
        default:
            error = .unknown
        }
        return error
    }
}
