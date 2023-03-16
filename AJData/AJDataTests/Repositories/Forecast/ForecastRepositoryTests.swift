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

    private let timeout:Double = 5
    private var repository: ForecastRepositoryType!
    private var cancellables: Set<AnyCancellable>!

    //TODO: change do a Spy
    private var remoteDataSource: ForecastRemoteDataSourceType!
    private var localDataSource: ForecastLocalDataSourceType!
    private var httpClient: AJHttpClientType!


    override func setUpWithError() throws {
        cancellables = []
        httpClient = AJHttpClient()
        localDataSource = ForecastLocalDataSource()
        remoteDataSource = ForecastRemoteDataSource(
            httpClient: httpClient
        )
        repository = ForecastRepository(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource
        )
    }

    override func tearDownWithError() throws {

        remoteDataSource = nil
        httpClient = nil
        cancellables.removeAll()
        cancellables = nil

    }



    func test_getBy_WhenSuccess_ShouldReturnForecastDTO() throws {

        //arrange
        let expectation = self.expectation(description: #function)
        let latitude: Double = 40.64
        let longitude: Double = -8.64
        let cityExpected = "Aveiro"
        let cityIdExpected = 2742611

        //act
        repository.getBy(
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
            receiveValue: { forecastDTO in
                //assert
                XCTAssertEqual(forecastDTO.city.coord.lat,latitude)
                XCTAssertEqual(forecastDTO.city.coord.lon,longitude)
                XCTAssertEqual(forecastDTO.city.name,cityExpected)
                XCTAssertEqual(forecastDTO.city.id,cityIdExpected)
            }
        )
        .store(in: &self.cancellables)

        waitForExpectations(timeout: timeout)
    }
}

