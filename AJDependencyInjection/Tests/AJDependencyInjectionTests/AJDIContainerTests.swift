import XCTest
@testable import AJDependencyInjection

final class AJDIContainerTests: XCTestCase {
    
    private var di: AJDIContainer!
    
    override func setUpWithError() throws {
        AJDIContainer().dispose()
        di = AJDIContainer()
    }
    
    override func tearDownWithError() throws {
        
        di.dispose()
        di = nil
    }
    
    func test_RegisterAndResolve_WhenRegisterNewServiceShouldResolveAndReturnThisService() throws {
        
        //arrange
        let fakePropertyExpectedValue = "fakeValue"
        
        di.register(type: FakeServiceType.self) { container in
            FakeServiceImpl(fakeProperty: fakePropertyExpectedValue)
        }
        di.register(type: FakeService2Type.self) { container in
            FakeService2Impl()
        }
        di.register(type: FakeService3Type.self) { container in
            FakeService3Impl()
        }
        
        //act
        let fakeServiceImpl = try? di.resolve(type: FakeServiceType.self)
        let fakeService2Impl = try? di.resolve(type: FakeService2Type.self)
        let fakeService3Impl = try? di.resolve(type: FakeService3Type.self)
        
        //assert
        XCTAssertTrue(fakeServiceImpl is FakeServiceImpl)
        XCTAssertEqual(fakeServiceImpl?.fakeProperty,fakePropertyExpectedValue)
        XCTAssertTrue(fakeService2Impl is FakeService2Impl)
        XCTAssertTrue(fakeService3Impl is FakeService3Impl)
    }
    
    func test_Resolve_WhenServiceIsNotFoundShouldReturnError() throws {
        
        //arrange
        let expectedErrorType = "\(FakeServiceType.self)"
        
        //act
        XCTAssertThrowsError(try di.resolve(type: FakeServiceType.self)) { error in
            
            guard let aJDIContainerError = error as? AJDIContainerError else {
                XCTFail("Should return a AJDIContainerError")
                return
            }
            
            switch aJDIContainerError {
                case .serviceNotRegistered(let type):
                    //assert
                    XCTAssertEqual(type, expectedErrorType)
                default:
                    XCTFail("Should return a serviceNotRegistered")
            }
        }
    }
    
    func test_Dispose_WhenCalledShouldCleanAllServiceFromMenory() throws {
        
        //arrange
        let fakePropertyExpectedValue = "fakeValue"
        di.register(type: FakeServiceType.self) { container in
            FakeServiceImpl(fakeProperty: fakePropertyExpectedValue)
        }
        let fakeServiceImpl = try? di.resolve(type: FakeServiceType.self)
       
        
        //act
        di.dispose()
        let fakeServiceImplExpectedShouldBeNil = try? di.resolve(type: FakeServiceType.self)
        
        //assert
        XCTAssertTrue(fakeServiceImpl is FakeServiceImpl)
        XCTAssertEqual(fakeServiceImpl?.fakeProperty,fakePropertyExpectedValue)
        XCTAssertNil(fakeServiceImplExpectedShouldBeNil)
    }
    
}

private protocol FakeServiceType {
    
    var fakeProperty: String { get }
}

private class FakeServiceImpl: FakeServiceType {
    
    let fakeProperty: String
    
    init(fakeProperty: String) {
        self.fakeProperty = fakeProperty
    }
}

private protocol FakeService2Type {}
private class FakeService2Impl: FakeService2Type {}

private protocol FakeService3Type {}
private class FakeService3Impl: FakeService3Type {}
