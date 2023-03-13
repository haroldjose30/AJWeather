//
//  AJHttpRequestGetJson.swift
//  
//
//  Created by Jose Harold on 13/03/2023.
//

protocol AJHttpRequestGetJson: AJHttpRequestGet {
    associatedtype ResponseType: Decodable
}
