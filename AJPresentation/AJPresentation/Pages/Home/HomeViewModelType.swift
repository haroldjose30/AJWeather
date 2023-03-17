//
//  HomeViewModelType.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

public protocol HomeViewModelType: ObservableObject {
    var viewState: ViewState<HomeViewObject> { get set }
    func loadData()
}
