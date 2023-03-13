//
//  GetWeatherByCityUseCaseTest.swift
//  AJDomainTests
//
//  Created by Jose Harold on 13/03/2023.
//

import XCTest
import Combine
@testable import AJDomain

final class GetWeatherByCityUseCaseTest: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    private var useCase: GetWeatherByCityUseCase!
    
    override func setUpWithError() throws {
        cancellables = []
        useCase = GetWeatherByCityUseCase()
    }
    
    override func tearDownWithError() throws {
        useCase = nil
    }
    
    func testExecute() throws {
        
        //arrange
        let expectation = self.expectation(description: #function)
        let city = "Aveiro"
        let country = "PT"
        
        //act
        useCase.execute(
            city: city,
            country: country
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
            receiveValue: { forecastModel in
                XCTAssertNotNil(forecastModel)
            }
        )
        .store(in: &cancellables)

        //assert
        waitForExpectations(timeout: 2)
    }
}
