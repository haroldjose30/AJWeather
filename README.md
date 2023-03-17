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
- Overview: This project, although very simple, was designed and developed to be scalable and easy to maintain.
Was divided in layers using Clean Code Archteture. This fisical layer define context responsibilities 
and avoid commons mistakes for example: User a ForeCaseResponse in Presentation layer.

### AJWeather
- Type: IOS App Project
- Responsability: Used to configure App startup, dependency injection, and deployment information and navigations
- Note: For this project I used a very simplest router to finished the project, in a real project I´ll prefer to 
use Coordinator Pattern with UIKit and avoid to use NavigationView from SwiftUI.

### AJPresentation
- Type: XCFramework project
- Responsability: Here we have all UI Elements, here are all SwiftUI Pages, Components, ViewModels, and ViewObjects.

### AJDomain
- Type: XCFramework project
- Responsability: for business domain rules. UseCase and Models will stay here.

### AJData
- Type: XCFramework project
- Responsability: for API requests, local database, repository patterns, and DTOs.

### AJHttpClient
- Type: SPM - Swift Package Manager Project 
- Responsability: to be an independent module responsible for all HTTP request handlers, can be shared with other projects.

### AJDependencyInjection
- Type: SPM - Swift Package Manager Project 
- Responsability: to be an independent module responsible for register and resolver dependency injections, can be shared with other projects.

## TODO:

- Home Page
    - [X] Day section - 5 days
    - [X] every 3 hour forecast a cell: with Icon, time and temperature
    - [X] optional: With coredata, Store the city information for situations where there is not connection
    - [ ] optional: search City bar
    - [ ] optional: download and cache icon. Do not bundle it in the App.
    
- Detail City Page
    - [X] optional: detailed view for each city, present all the info of the city model
    - [X] optional: map view with a pin on the city’s coordinates. 
    
- [ ] optional: Search City Page
