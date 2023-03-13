//
//  DefaultScheduler.swift
//  AJDomain
//
//  Created by Jose Harold on 13/03/2023.
//

class SchedulerDefault: SchedulerType {
    var execution: DispatchQueue = DispatchQueue.global(qos: .background)
    var postExecution: DispatchQueue = DispatchQueue.main
}

