import XCTest
@testable import Core

class RequestBuilderTest: XCTestCase {
            
    func testRequestBuilder() throws {
        // Given
        let request = Request(method: .get, path: "movie/now_playing", params: [("page", "1")])
        // When
        let urlRequest = try XCTUnwrap(RequestBuilder().buildRequest(request: request))
        // Then
        XCTAssertNil(urlRequest.value(forHTTPHeaderField: "api_key"))
        XCTAssertNil(urlRequest.value(forHTTPHeaderField: "language"))
        XCTAssertEqual(urlRequest.httpMethod, HTTPMethod.get.rawValue)
    }
}
