import XCTest
@testable import EditMenu

final class EditMenuTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(EditMenu().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
