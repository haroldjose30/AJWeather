//
//  ForecastRepositoryTests.swift
//  AJDataTests
//
//  Created by Jose Harold on 15/03/2023.
//

//
//  ForecastRemoteDataSourceTests.swift
//  AJDataTests
//
//  Created by Jose Harold on 12/03/2023.
//

import XCTest
import AJHttpClient
import Combine
@testable import AJData

final class ForecastRepositoryTests: XCTestCase {
    
    private let timeout: Double = 5
    private var repository: ForecastRepositoryType!
    private var cancellables: Set<AnyCancellable>!
    
    //TODO: change to a Spy
    private var forecastRemoteDataSource: ForecastRemoteDataSourceType!
    private var forecastLocalDataSource: ForecastLocalDataSourceType!
    private var httpClient: AJHttpClientType!
    private var cityLocalDataSource: CityLocalDataSource!
    private var forecastDetailLocalDataSource: ForecastDetailLocalDataSource!
    private var weatherLocalDataSource: WeatherLocalDataSource!
    
    override func setUpWithError() throws {
        
        CoreDataManager.getInstance(inMemory: true).initialize()
        
        cancellables = []
        httpClient = AJHttpClient()
        cityLocalDataSource = CityLocalDataSource()
        forecastDetailLocalDataSource = ForecastDetailLocalDataSource()
        weatherLocalDataSource = WeatherLocalDataSource()
        forecastLocalDataSource = ForecastLocalDataSource(
            cityLocalDataSource: cityLocalDataSource,
            forecastDetailLocalDataSource: forecastDetailLocalDataSource,
            weatherLocalDataSource: weatherLocalDataSource
        )
        forecastRemoteDataSource = ForecastRemoteDataSource(
            httpClient: httpClient
        )
        repository = ForecastRepository(
            remoteDataSource: forecastRemoteDataSource,
            localDataSource: forecastLocalDataSource
        )
    }
    
    override func tearDownWithError() throws {
        
        forecastLocalDataSource = nil
        forecastRemoteDataSource = nil
        httpClient = nil
        cancellables.removeAll()
        cancellables = nil
        cityLocalDataSource = nil
        forecastDetailLocalDataSource = nil
        weatherLocalDataSource = nil
    }
    
    
    
    func test_getBy_WhenSuccess_ShouldReturnForecastDTO() throws {
        
        //arrange
        let expectation = self.expectation(description: #function)
        let latitude: Float = 40.64
        let longitude: Float = -8.64
        let cityExpected = "Aveiro"
        let cityIdExpected = "2742611"
        
        //act
        repository.getBy(
            latitude: latitude,
            longitude: longitude
        )
        .sink(
            receiveCompletion: ({ completion in
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
                expectation.fulfill()
                
            }),
            receiveValue: ({ forecastDTO in
                
                //assert
                XCTAssertEqual(forecastDTO.city.latitude,latitude)
                XCTAssertEqual(forecastDTO.city.longitude,longitude)
                XCTAssertEqual(forecastDTO.city.name,cityExpected)
                XCTAssertEqual(forecastDTO.city.id,cityIdExpected)
                
            })
        )
        .store(in: &self.cancellables)
        
        waitForExpectations(timeout: timeout)
    }
}

