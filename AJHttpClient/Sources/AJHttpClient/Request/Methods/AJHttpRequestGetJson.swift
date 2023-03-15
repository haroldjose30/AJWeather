//
//  AJHttpRequestGetJson.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

public protocol AJHttpRequestGetJson: AJHttpRequestGet {
    associatedtype ResponseType: Decodable
}
