import XCTest
@testable import KCP

final class libkcpTests: XCTestCase {
    func testKcpConfigDefaults() {
        let config = KcpConfig()

        XCTAssertEqual(config.crypt, .none)
        XCTAssertEqual(config.mode, .fast)
        XCTAssertEqual(config.dataShards, 10)
        XCTAssertEqual(config.parityShards, 3)
    }

    static var allTests = [
        ("testKcpConfigDefaults", testKcpConfigDefaults),
    ]
}
