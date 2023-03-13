//
//  AJHttpResponse+toJson.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

import Combine
import Foundation

extension AJHttpResponse  {
    
    private func toJsonInternal<Y:Decodable>() -> AnyPublisher<Y, AJHttpError> {
        publisher(type: Y.self) { (data) in
            do {
                let result = try JSONDecoder().decode(Y.self, from: data)
                return result
            } catch let error {
                throw AJHttpError.decodingError(error.localizedDescription)
            }
        }
    }
}

extension AJHttpResponse where T: AJHttpRequestGetJson   {
    
    func toJson() -> AnyPublisher<T.ResponseType, AJHttpError> {
        toJsonInternal()
    }
    
}
