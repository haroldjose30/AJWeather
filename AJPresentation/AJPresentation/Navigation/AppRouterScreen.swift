//
//  AppRouterScreen.swift
//  AJWeatherApp
//
//  Created by Jose Harold on 17/03/2023.
//

import AJDomain

public enum AppRouterScreen {
    case homePage(city: CityModel?)
    case cityDetailPage(city: CityModel)
    case citySearchPage
}

