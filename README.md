# AJWeather

## Description

Is an app that retrieves information from OpenWeather API, and list
the daily weather forecast for the next five days for a specific city.

Requirements: 
 - Every day should be a section and every 3 hours forecast a cell within that
section.
 - Sections must clearly show the date.
 - Cells must show the time and temperature

Extras:
- Show the weather icon in each cell (download and cache it. Do not
bundle it in the App)
- Add a search bar to enable the search of weather info for any city.
- Store the city information for situations where there is not
connection
- Add a detailed view for each city, clicking on a stored city would
present all the info of the city model, including a map view with a
pin on the city’s coordinates. 

## Project Structure:
- The project was divided into layers to avoid mistakes, and guarantee context responsibilities.

### AJWeatherApp
- IOS App, used to configure all dependency and deployment information

### AJPresentation
- XCFramework project responsible for all UI Elements, here are all SwiftUI Pages, Components, ViewModels, and ViewObjects.

### AJDomain
- XCFramework project responsible for business domain rules. UseCase and Models will stay here.

### AJData
- XCFramework project responsible for  API requests, local database, repository, and DTOs.

### AJHttpClient
- SPM - Swift Package Manager Project to be an independent component responsible for all HTTP request handlers.
### AJDependencyInjection
- SPM - Swift Package Manager Project to be an independent component responsible for register and resolver dependency injections.

## TODO:

- [ ] Home Page
    - [X] Day section - 5 days
    - [X] every 3 hour forecast a cell: with Icon, time and temperature
    - [X] optional: With coredata, Store the city information for situations where there is not connection
    - [ ] optional: search City bar
    - [ ] optional: download and cache icon. Do not bundle it in the App.
    
- [ ] optional: Detail City Page
    - [ ] detailed view for each city, present all the info of the city model
    - [ ] map view with a pin on the city’s coordinates. 
    
- [ ] optional: Search City Page
  

## Project Structure Draft:

App/ -> IOS Main App
    AppDelegate.swift
    SceneDelegate.swift
    Coordinators Or Router/
        AppCoordinator.swift
        WeatherListCoordinator.swift
        CityDetailPageCoordinator.swift
    DI/
        AppDI.Swift
  
LibPresentation/ -> XCFramework
    DI/
        AppDI+Presentation.swift
    Assets/
    Components/
        MapView.swift      
    Pages/
        WeatherListPage/
            Components/
                sample.Swift
            WeatherListPage.swift
            WeatherListPageViewModel.swift
        CityDetailPage/
            Components/
                sample.Swift
            CityDetailPage.swift
            CityDetailPageViewModel.swift    

LibDomain/ -> XCFramework
    DI/
        AppDI+Domain.swift
    Model/
        WeatherModel.swift
        CityModel.swift
    UseCases/
        GetCityListByName.swift
        GetWeatherByCity.swift

LibData/ -> XCFramework
    DI/
        AppDI+Data.swift
    DataSource
        Remote/
            CityApi.swift
            WeatherApi.swift
        Local/ -> CoreData
            CityDatabase.swift
            WeatherDatabase.swift
    Repositories/
        CityRepository.swift
        WeatherRepository.swift
    DTO
        CityDTO.Swift
        WeatherDTO.Swift

LibHttp -> Swift Package Manager
    ClientHttp.swift

LibDI -> Swift Package Manager
    ServiceLocator.swift
