//
//  AJInjected_PropertyWrapper.swift
//  
//
//  Created by Jose Harold on 17/03/2023.
//

import Foundation
import SwiftUI
import Combine

@propertyWrapper
///Can be used in a ViewController, Presenter, or ViewModel, preferentially in a viewController
public struct AJInjected<T> {
    
    private var service: T
    
    public init() {
        
        if let serviceUnwrapped = try? AJDIContainer().resolve(type: T.self) {
            self.service = serviceUnwrapped
            return
        }
        
        fatalError("\(String(describing: T.self)) service not registered")
    }
    
    public init(wrappedValue: T) {
        self.service = wrappedValue
    }
    
    public var wrappedValue: T {
        get { return service }
        mutating set { service = newValue }
    }
    
    public var projectedValue: AJInjected<T> {
        get { return self }
        mutating set { self = newValue }
    }
}

@propertyWrapper
public struct AJInjectedObject<T>: DynamicProperty where T: ObservableObject {
    
    @ObservedObject private var service: T
    
    public init() {
        if let serviceUnwrapped = try? AJDIContainer().resolve(type: T.self) {
            self.service = serviceUnwrapped
            return
        }
        
        fatalError("\(String(describing: T.self)) service not registered")
    }
    
    public init(wrappedValue: T) {
        self.service = wrappedValue
    }

    public var wrappedValue: T {
        get { return service }
        mutating set { service = newValue }
    }
    
    public var projectedValue: ObservedObject<T>.Wrapper {
        return self.$service
    }
}
