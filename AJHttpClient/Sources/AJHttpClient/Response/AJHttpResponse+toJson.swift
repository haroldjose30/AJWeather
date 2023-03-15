//
//  AJHttpResponse+asJson.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

import Combine
import Foundation

extension AJHttpResponse  {
    
    private func asJsonInternal<Y:Decodable>() -> AnyPublisher<Y, AJHttpError> {
        publisher(type: Y.self) { (data) in
            do {
                AJHttpLogger.print("asJsonInternal.Type:",Y.self)
                let result = try JSONDecoder().decode(Y.self, from: data)
                AJHttpLogger.print("asJsonInternal.decoded:", result)
                return result
            } catch let error {
                AJHttpLogger.print("asJsonInternal.Error:",error)
                throw AJHttpError.decodingError(error.localizedDescription)
            }
        }
    }
    
    public func asPlainText() -> AnyPublisher<String, AJHttpError> {
        publisher(type: String.self) { data in
            guard let string = String(data: data, encoding: .utf8) else {
                AJHttpLogger.print("asPlainText.Error: Couldn't decode response as plain text")
                throw AJHttpError.unknown
            }
            return string
        }
    }
}

public extension AJHttpResponse where T: AJHttpRequestGetJson   {
    
    func asJson() -> AnyPublisher<T.ResponseType, AJHttpError> {
        asJsonInternal()
    }
    
}
