//
//  AJDIContainerError.swift
//  
//
//  Created by Jose Harold on 15/03/2023.
//

public enum AJDIContainerError: Error {
    
    case serviceNotRegistered(type:String?)
    case unknown
}
