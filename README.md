# AJWeather

## Description

Is an app that retrieves information from OpenWeather API, and list
the daily weather forecast for the next five days for a specific city.

Requirementes: 
 - Every day should be a section and every 3 hour forecast a cell within that
section.
 - Sections must clearly show the date.
 - Cells must show the time and temperature

Extras:
- Show the weather icon in each cell (download and cache it. Do not
bundle it in the App)
- Add a search bar to enable search of weather info for any city.
- Store the city information for situations where there is not
connection
- Add a detailed view for each city, clicking on a stored city would
present all the info of the city model, including a map view with a
pin on the city’s coordinates. 

## Project Structure:

### AJWeatherApp

### AJPresentation

### AJDomain

### AJData

### AJHttpClient

### AJDependencyInjection


## TODO:

[] Home Page
    [X] Day section - 5 days
    [] every 3 hour forecast a cell: with Icon, time and temperature
    [] optional: With coredata, Store the city information for situations where there is not connection
    [] optional: download and cache icon. Do not bundle it in the App.
    [] optional: search City bar
    
[] optional: Detail City Page
    [] detailed view for each city, resent all the info of the city model
    [] map view with a pin on the city’s coordinates. 
    
[] optional: Search City Page
  


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






 
