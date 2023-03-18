//
//  AppRouterState.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

public class AppRouterState: ObservableObject {
    
    @Published var currentPage: AppRouterScreen = .homePage(city: nil)
    
    public init(){}
}
