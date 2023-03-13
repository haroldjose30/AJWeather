//
//  ViewStateBase.swift
//  AJPresentation
//
//  Created by Jose Harold on 13/03/2023.
//

public enum ViewStateBase<T> {
    
    case idle
    case loading
    case success(data: T)
    case failed(
        message: String? = nil,
        action: (()->Void)? = nil
    )
}
