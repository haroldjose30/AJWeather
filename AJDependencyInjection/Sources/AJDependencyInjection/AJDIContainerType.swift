//
//  AJDIContainerType.swift
//  
//
//  Created by Jose Harold on 14/03/2023.
//

public typealias FactoryClosure = (AJDIContainer) throws -> AnyObject

public protocol AJDIContainerType {
    
    func register<Service>(
        type: Service.Type,
        factoryClosure: @escaping FactoryClosure
    )
    
    func resolve<Service>(
        type: Service.Type
    ) throws -> Service
    
    func dispose()
}
