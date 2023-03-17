import XCTest
import Combine
@testable import AJHttpClient

final class AJHttpClientTests: XCTestCase {
    
    private let timeout: Double = 5
    private var httpClient: AJHttpClientType!
    private var cancellables: Set<AnyCancellable>!
    
    
    override func setUpWithError() throws {
        cancellables = []
        httpClient = AJHttpClient()
    }
    
    override func tearDownWithError() throws {
        httpClient = nil
        cancellables.removeAll()
        cancellables = nil
    }
    
    func test_send_HttpGet_WhenStatusCodeIs200_ShouldReturnSerializedObjectWithValue() throws {
        
        //arrange
        let expectation = self.expectation(description: #function)
        let request = GetMessageRequestMocky(
            path: MockyEndpoint.statuCode200AndReturnMessage
        )
        
        //act
        self.httpClient.send(request)
            .asJson()
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
            path: MockyEndpoint.statuCode400BadRequest
        )
        
        //act
        self.httpClient.send(request)
            .asJson()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        //assert
                        XCTAssertEqual(error, AJHttpError.badRequest)
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
