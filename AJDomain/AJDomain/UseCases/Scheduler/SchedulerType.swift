//
//  SchedulerType.swift
//  AJDomain
//
//  Created by Jose Harold on 13/03/2023.
//

public protocol SchedulerType {
    
    var execution: DispatchQueue { get set }
    var postExecution: DispatchQueue { get set }
}
