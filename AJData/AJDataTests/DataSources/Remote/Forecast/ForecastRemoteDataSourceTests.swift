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

final class ForecastRemoteDataSourceTests: XCTestCase {
    
    private let timeout:Float = 5
    private var remoteDataSource: ForecastRemoteDataSourceType!
    //TODO: change to a spy or mock
    private var httpClient: AJHttpClientType!
    private var cancellables: Set<AnyCancellable>!
    
    
    override func setUpWithError() throws {
        cancellables = []
        httpClient = AJHttpClient()
        remoteDataSource = ForecastRemoteDataSource(
            httpClient: httpClient
        )
    }
    
    override func tearDownWithError() throws {
        
        remoteDataSource = nil
        httpClient = nil
        cancellables.removeAll()
        cancellables = nil
        
    }
    
    func test_getBy_WhenSuccess_ShouldReturnForecastResponseDTO() throws {
        
        //arrange
        let expectation = self.expectation(description: #function)
        let latitude: Float = 40.64
        let longitude: Float = -8.64
        let cityExpected = "Aveiro"
        let cityIdExpected = 2742611
        
        //act
        remoteDataSource.getBy(
            latitude: latitude,
            longitude: longitude
        )
        .sink(
            receiveCompletion: { completion in
                
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTFail(error.localizedDescription)
                    
                }
                expectation.fulfill()
                
            },
            receiveValue: { response in
                //assert
                XCTAssertEqual(response.city.coord.lat,latitude)
                XCTAssertEqual(response.city.coord.lon,longitude)
                XCTAssertEqual(response.city.name,cityExpected)
                XCTAssertEqual(response.city.id,cityIdExpected)
            }
        )
        .store(in: &self.cancellables)
        
        
        waitForExpectations(timeout: timeout)
    }
}
