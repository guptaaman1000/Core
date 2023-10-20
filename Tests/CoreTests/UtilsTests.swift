import XCTest
@testable import Core

final class UtilsTests: XCTestCase {
    
    func testObjectName() {
        XCTAssertEqual(UIViewController.name, "UIViewController")
    }
    
    func testStatusCode_success() {
        // Given
        let response = HTTPURLResponse(url: URL(string: "https://www.google.com")!,
                                       statusCode: 210,
                                       httpVersion: nil,
                                       headerFields: nil)!
        // Then
        XCTAssertEqual(response.httpStatusCode, 210)
    }
    
    func testStatusCode_failure() {
        // Given
        let response = URLResponse()
        // Then
        XCTAssertEqual(response.httpStatusCode, 0)
    }
    
    func testHttpStatus_success() {
        // Given
        let response = HTTPURLResponse(url: URL(string: "https://www.google.com")!,
                                       statusCode: 210,
                                       httpVersion: nil,
                                       headerFields: nil)!
        // Then
        XCTAssertTrue(response.isSuccess)
    }
    
    func testHttpStatus_failure() {
        // Given
        let response = HTTPURLResponse(url: URL(string: "https://www.google.com")!,
                                       statusCode: 310,
                                       httpVersion: nil,
                                       headerFields: nil)!
        // Then
        XCTAssertFalse(response.isSuccess)
    }
}
