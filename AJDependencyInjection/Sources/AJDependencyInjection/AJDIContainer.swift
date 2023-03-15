//
//  AJDependencyInjection.swift
//  Monostate pattern
//
//  Created by Jose Harold on 14/03/2023.
//

public final class AJDIContainer: AJDIContainerType {
    
    public init() {}
    private static var _shared: AJDIContainer?
    private var shared: AJDIContainer {
        get {
            
            if let container = AJDIContainer._shared {
                return container
            }
            
            let container = AJDIContainer()
            AJDIContainer._shared = container
            return container
        }
    }
    
    private var services = Dictionary<String, FactoryClosure>()
    
    public func register<Service>(
        type: Service.Type,
        factoryClosure: @escaping FactoryClosure
    ) {
        self.shared.services["\(type)"] = factoryClosure
    }
    
    public func resolve<Service>(
        type: Service.Type
    ) throws -> Service  {
        
        let key = "\(type)"
        guard let serviceUnwrapped = try? self.shared.services[key]?(self) as? Service else {
            throw AJDIContainerError.serviceNotRegistered(type: key)
        }
        return serviceUnwrapped
    }
    
    public func dispose() {
        
        guard let container = AJDIContainer._shared else {
            return
        }        
        container.services.removeAll()
        AJDIContainer._shared = nil
    }
}
