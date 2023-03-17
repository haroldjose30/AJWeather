//
//  CityLocalDataSourceTests.swift
//  AJDataTests
//
//  Created by Jose Harold on 16/03/2023.
//

import XCTest
@testable import AJData

final class CityLocalDataSourceTests: XCTestCase {
    
    private var localDataSource: CityLocalDataSource!

    override func setUpWithError() throws {
        
        //Use database inMemory to perform tests
        CoreDataManager.getInstance(inMemory: true).initialize()
        localDataSource = CityLocalDataSource()
    }

    override func tearDownWithError() throws {
        
        CoreDataManager.getInstance().dispose()
        localDataSource = nil
    }

    func test_CreateReadUpdateDelete_Success() async throws {
        
        let entityId = "1000"
        
        //act & assert ReadAll should be Empty
        let citiesEmpty = try await localDataSource.getAll()
        XCTAssertEqual(citiesEmpty.count, 0)
        
        //act & assert Create should has 1 item
        let entityToCreate = CityEntity(
            id: entityId,
            name: "FakeCity",
            latitude: 10,
            longitude: 10,
            country: "FK"
        )
        try await localDataSource.create(entity: entityToCreate)
        let cities = try await localDataSource.getAll()
        XCTAssertEqual(cities.count, 1)
        XCTAssertEqual(cities.first, entityToCreate)
        
        //act & assert Update should return updated item
        let entityToUpdate = CityEntity(
            id: entityId,
            name: "FakeCityUpdated",
            latitude: 11,
            longitude: 11,
            country: "FKU"
        )
        
        let entityBeforeUpdate = try await localDataSource.getById(entityId)
        XCTAssertEqual(entityBeforeUpdate, entityToCreate)
        XCTAssertNotEqual(entityBeforeUpdate, entityToUpdate)
        
        try await localDataSource.update(entity: entityToUpdate)
        let entityAfterUpdate = try await localDataSource.getById(entityId)
        XCTAssertNotEqual(entityAfterUpdate, entityToCreate)
        XCTAssertEqual(entityAfterUpdate, entityToUpdate)
        
        //act & assert Delete should return zero itens
        try await localDataSource.delete(entityId)
        let citiesEmptyAfterDelete = try await localDataSource.getAll()
        XCTAssertEqual(citiesEmptyAfterDelete.count, 0)
    }
}
