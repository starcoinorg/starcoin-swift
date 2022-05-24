import XCTest

@testable import starcoin
@testable import SwiftJSONRPC
@testable import PromiseKit
import CoreMedia

final class starcoinTests: XCTestCase {
    var url = "https://main-seed.starcoin.org"

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }

    func testGetNodeInfo() throws {
        let service = StarcoinClient(url: "https://main-seed.starcoin.org")
        // Perform request
        let rs = service.nodeInfo()
        do {
            let nodeInfo = try rs.wait()
            debugPrint(nodeInfo.peer_info?.notif_protocols)
        } catch {
            print("error", rs.error, rs.value)
        }
    }


    func testGetBlockByNumber() throws {
        let service = StarcoinClient(url: "https://main-seed.starcoin.org")
        // Perform request
        let rs = service.getBlockByNumber(number: 5909775)
        do {
            let nodeInfo = try rs.wait()
            debugPrint(nodeInfo.header?.block_hash)
        } catch {
            print("error", rs.error, rs.value)
        }
    }
}

