import Foundation
import XCTest
@testable import starcoin
@testable import PromiseKit
import CoreMedia

final class RpcStateTest: XCTestCase {
    var url = "https://main-seed.starcoin.org"
    let address = "0x22a19240709CB17ec9523252AA17B997"
    func testGetAccountState() throws {
        let service = RPC(url: url)
        let success = expectation(description: "success")
        service.getAccountState(address:address) { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}