import XCTest
import Combine
@testable import AJHttpClient

final class AJHttpClientTests: XCTestCase {
    
    private let timeout:Double = 5
    private var httpClient: AJHttpClientType!
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUp() async throws {
        
        httpClient = AJHttpClient()
    }
    
    override func tearDown() async throws {
        
        httpClient = nil
    }
    
    
    func test_send_HttpGet_WhenStatusCodeIs200_ShouldReturnSerializedObjectWithValue() throws {
        
        //arrange
        let expectation = self.expectation(description: #function)
        let request = GetMessageRequestMocky(
            path: MockyAPI.statuCode200AndReturnMessage
        )
        
        //act
        self.httpClient.send(request)
            .toJson()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                        case .finished: do {}
                        case .failure(let error): do {
                            XCTFail(error.localizedDescription)
                        }
                    }
                    expectation.fulfill()
                },
                receiveValue: { response in
                    //assert
                    XCTAssertEqual(response.message,"success")
                }
            )
            .store(in: &self.cancellables)
        
        waitForExpectations(timeout: timeout)
    }
    
    func test_send_HttpGet_WhenStatusCodeIs400_ShouldReturnBadRequestError() throws {
        
        //arrange
        let expectation = self.expectation(description: #function)
        let request = GetMessageRequestMocky(
            path: MockyAPI.statuCode400BadRequest
        )
        
        //act
        self.httpClient.send(request)
            .toJson()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                        case .finished: do {}
                        case .failure(let error): do {
                            //assert
                            XCTAssertEqual(error, AJHttpError.badRequest)
                        }
                    }
                    expectation.fulfill()
                },
                receiveValue: { response in
                    
                    XCTFail("Should not return response")
                }
            )
            .store(in: &self.cancellables)
        
        waitForExpectations(timeout: timeout)
    }
}
