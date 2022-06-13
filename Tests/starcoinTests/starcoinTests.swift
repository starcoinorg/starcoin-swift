import XCTest

@testable import starcoin
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
        let service = RPC(url: url)
        let success = expectation(description: "success")
        service.nodeInfo { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testGetEvents() throws {
        let service = RPC(url: url)
        let filter = EventFilter(addrs: ["0x22a19240709CB17ec9523252AA17B997"], type_tags: [], from_block: 1, to_block: 10, event_keys: []);
        let success = expectation(description: "success")
        service.getEvents(eventFilter: filter) { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }


//    func testGetTransactionProof() throws {
//        let service = RPC(url: url)
//        let success = expectation(description: "success")
//        let blockHash = "0x37e8dd4f432a1c3a7b6dfcaa90ebf2aafa0287678ffe4b8ad2373c5b48ffb20c";
//        let txGlobalIdx  = 231188;
//        let eventIndex  = 1;
//        service.getTransactionProof(blockHash: blockHash, txGlobalIndex: txGlobalIdx, eventIndex: eventIndex) { result in
//            let info = try! result.get()
//            print(info)
//            success.fulfill()
//        }
//        waitForExpectations(timeout: 10, handler: nil)
//    }

    func testGetTransactionByHash() throws {
        let service = RPC(url: url)
        let success = expectation(description: "success")
        let hash = "0xaaed473d705f7e727c8b7db2c331098731e2c3d601fe2296a8aea9b037420e81";
        service.getTransactionByHash(transactionHash:hash) { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }


    func testGetPendingTransactionByHash() throws {
        let service = RPC(url: url)
        let success = expectation(description: "success")
        let hash = "0xbabcee51c3b3ad106fc6ea80504d85947f741cbd65b9e1408ce4b4620a06f28b";
        service.getPendingTransactionByHash(hash: hash) { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testGetTransactionInfoByHash() throws {
        let service = RPC(url: url)
        // Perform request
        let success = expectation(description: "success")
        service.getTransactionInfoByHash(hash: "0xd785246040632b9e130cc34887c42df335b61ced4a28a34381e44e56b5d39383") { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testGetTransactionEventByHash() throws {
        let service = RPC(url: url)
        let success = expectation(description: "success")
        service.getTransactionEventByHash(hash: "0xce694b17cd309852940893e959e61536cd91d94edd79cbed33563b37157a1772") { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testGetBlockByHash() throws {
        let service = RPC(url: url)
        let success = expectation(description: "success")
        service.getBlockByHash(blockHash: "0x420de898aa5900fe656a51273e3c8cf8cb9c3700903f9ff3198d048a77edb22f") { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testGetBlockByNumber() throws {
        let service = RPC(url: url)
        let success = expectation(description: "success")
        service.getBlockByNumber(number: 5616845) { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testGetBlockInfoByNumber() throws {
        let service = RPC(url: url)
        let success = expectation(description: "success")
        service.getBlockInfoByNumber(number: 5616845) { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

//    func testGetBlockHeaderAndBlockInfoByNumber() throws {
//        let service = RPC(url: url)
//        let success = expectation(description: "success")
//        service.getBlockHeaderAndBlockInfoByNumber(number: 5616845) { result in
//            let info = try! result.get()
//            print(info)
//            success.fulfill()
//        }
//        waitForExpectations(timeout: 10, handler: nil)
//    }


//    func testHeaderWithDifficultyInfoByNumber() throws {
//        let service = RPC(url: url)
//        let success = expectation(description: "success")
//        service.headerWithDifficultyInfoByNumber(number: 5616845) { result in
//            let info = try! result.get()
//            print(info)
//            success.fulfill()
//        }
//        waitForExpectations(timeout: 10, handler: nil)
//    }

    func testHeaderByNumber() throws {
        let service = RPC(url: url)
        let success = expectation(description: "success")
        service.headerByNumber(number: 5616845) { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }


    func testGetBlocksFromNumber() throws {
        let service = RPC(url: url)
        let success = expectation(description: "success")
        service.getBlocksFromNumber(number: 2,count: 10) { result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }


//    func testGetEpochResourceByHeight() throws {
//        let service = RPC(url: url)
//        let success = expectation(description: "success")
//        service.getEpochResourceByHeight(1) { result in
//            let info = try! result.get()
//            print(info)
//            success.fulfill()
//        }
//        waitForExpectations(timeout: 10, handler: nil)
//    }


//    func testGetEpochResource ()throws {
//         let service = RPC(url: url)
//        // Perform request
//        let rs = try service.getEpochResource(stateroot: "0x7244a297682da309e05bdd30a71876414cab8d499f5a904817bcd823307ad560")
//        do {
//            let nodeInfo = try rs.wait()
//            debugPrint(nodeInfo)
//        } catch {
//            print("error", rs.error, rs.value)
//        }
//    }

    func testListResource ()throws {
         let service = RPC(url: url)
        // Perform request
        let success = expectation(description: "success")
        service.listResource(address: "0x22a19240709CB17ec9523252AA17B997"){ result in
            let info = try! result.get()
            print(info)
            success.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }


}

