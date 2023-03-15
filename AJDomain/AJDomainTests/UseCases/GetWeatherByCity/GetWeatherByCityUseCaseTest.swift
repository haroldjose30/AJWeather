//
//  GetWeatherByCityUseCaseTest.swift
//  AJDomainTests
//
//  Created by Jose Harold on 13/03/2023.
//

import XCTest
import Combine
@testable import AJDomain
import AJData

final class GetWeatherByCityUseCaseTest: XCTestCase {
    
    private let timeout:Double = 5
    private var cancellables: Set<AnyCancellable>!
    private var useCase: GetForecastUseCase!
    private var scheduler: SchedulerType!
    private var repository: SpyForecastRepository!
    
    override func setUpWithError() throws {
        
        cancellables = []
        repository = SpyForecastRepository()
        scheduler = SchedulerDefault()
        useCase = GetForecastUseCase(
            repository: repository,
            scheduler: scheduler
        )
    }
    
    override func tearDownWithError() throws {
        
        useCase = nil
        scheduler = nil
        cancellables.removeAll()
        cancellables = nil
    }
    
    func test_Execute_WhenExecuteCalledWithSuccess_ShouldCallRepositoryAndReturnModel() throws {
        
        //arrange
        let expectation = self.expectation(description: #function)
        let latitude: Double = 40.64
        let longitude: Double = -8.64
        
        let forecastDTOExpected = ForecastDTO.fixture(
            city: .fixture(
                id: 2742611,
                name: "Aveiro"
            )
        )
        
        repository.getByToReturn = Future { promisse in
            promisse(.success(forecastDTOExpected))
        }
        
        //act
        useCase.execute(
            latitude: latitude,
            longitude: longitude
        ).sink(
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
                //assert
                XCTAssertTrue(self.repository.getByCalled)
                XCTAssertEqual(forecastModel.city.id, forecastDTOExpected.city.id)
                XCTAssertEqual(forecastModel.city.name, forecastDTOExpected.city.name)
            }
        )
        .store(in: &cancellables)
        
        
        waitForExpectations(timeout: timeout)
    }
    
    func test_Execute_WhenExecuteCalledWithError_ShouldReturnError() throws {
        
        //arrange
        let expectation = self.expectation(description: #function)
        let latitude: Double = 40.64
        let longitude: Double = -8.64
        
        repository.getByToReturn = Future { promisse in
            promisse(.failure(FakeError.error))
        }
        
        //act
        useCase.execute(
            latitude: latitude,
            longitude: longitude
        ).sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    //assert
                    XCTAssertTrue(self.repository.getByCalled)
                    XCTAssertTrue(error is FakeError)
                }
                
                expectation.fulfill()
            },
            receiveValue: { _ in
                XCTFail("Should not receive value")
            }
        )
        .store(in: &cancellables)
        
        
        waitForExpectations(timeout: timeout)
    }
}

private enum FakeError: Error {
    case error
}
