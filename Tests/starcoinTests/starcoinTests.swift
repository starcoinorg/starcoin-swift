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

    func testGetEvents() throws {
        // TODO ERROR
        let service = StarcoinClient(url: "https://main-seed.starcoin.org")
        let  filter = EventFilter(addrs: ["x22a19240709CB17ec9523252AA17B997"],type_tags: [], from_block: 2, to_block: 10,event_keys:[]);
        let rs = service.getEvents(eventFilter: filter)
        do {
            let nodeInfo = try rs.wait()
            debugPrint(nodeInfo)
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


    func testGetTransactionInfoByHash() throws {
        let service = StarcoinClient(url: "https://main-seed.starcoin.org")
        // Perform request
        let rs = service.getTransactionInfoByHash(hash:"0xd785246040632b9e130cc34887c42df335b61ced4a28a34381e44e56b5d39383")
        do {
            let nodeInfo = try rs.wait()
            debugPrint(nodeInfo.status)
        } catch {
            print("error", rs.error, rs.value)
        }
    }


    func testGetTransactionEventByHash ()throws {
        let service = StarcoinClient(url: "https://main-seed.starcoin.org")
        // Perform request
        let rs = service.getTransactionEventByHash(hash:"0xce694b17cd309852940893e959e61536cd91d94edd79cbed33563b37157a1772")
        do {
            let nodeInfo = try rs.wait()
            debugPrint(nodeInfo)
        } catch {
            print("error", rs.error, rs.value)
        }
    }
    func testGetEpochResource ()throws {
        let service = StarcoinClient(url: "https://main-seed.starcoin.org")
        // Perform request
        let rs = try service.getEpochResource(stateroot: "0x7244a297682da309e05bdd30a71876414cab8d499f5a904817bcd823307ad560")
        do {
            let nodeInfo = try rs.wait()
            debugPrint(nodeInfo)
        } catch {
            print("error", rs.error, rs.value)
        }
    }




}

