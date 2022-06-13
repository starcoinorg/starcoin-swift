
import Foundation
import JsonRPC
import Serializable

// Allow simple string errors
extension String: Error {
}

// Notification body structure
struct NewHeadsNotification: Decodable {
    let subscription: String
    let result: SerializableValue
}

class RPC {

    private let client: Client;

    public init(url: String) {
        client = JsonRpc(.http(url: URL(string: url)!), queue: .main)
    }

    public func nodeInfo(cb: @escaping ApiCallback<NodeInfo>) {
        client.call(
                method: "node.info",
                params: Nil.nil,
                NodeInfo.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }


    public func getEvents(eventFilter: EventFilter, cb: @escaping ApiCallback<[Event]>) {
        client.call(
                method: "chain.get_events",
                params: [eventFilter],
                [Event].self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }


//  public  func getTransactionProof(blockHash: String, txGlobalIndex: Int, eventIndex: Int,
//                             cb: @escaping ApiCallback<TransactionProof>) {
//        client.call(
//                method: "chain.get_transaction_proof",
//                params: [blockHash, txGlobalIndex, eventIndex],
//                TransactionProof.self,
//                SerializableValue.self
//        ) { response in
//            cb(response.mapError(AvalancheApiError.init).map {
//                $0
//            })
//        }
//    }

//
    public func getTransactionByHash(transactionHash: String,
                                     cb: @escaping ApiCallback<Transaction>) {
        client.call(
                method: "chain.get_transaction",
                params: [transactionHash],
                Transaction.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

    func getPendingTransactionByHash(hash: String, cb: @escaping ApiCallback<PendingTransaction>) {
        client.call(
                method: "txpool.pending_txn",
                params: [hash],
                PendingTransaction.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

//
//
    func getTransactionInfoByHash(hash: String, cb: @escaping ApiCallback<TransactionInfo>) {

        client.call(
                method: "chain.get_transaction_info",
                params: [hash],
                TransactionInfo.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

    func getTransactionEventByHash(hash: String, cb: @escaping ApiCallback<[Event]>) {
        client.call(
                method: "chain.get_transaction_info",
                params: [hash],
                [Event].self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

    func getBlockByHash(blockHash: String, cb: @escaping ApiCallback<Block>) {
        client.call(
                method: "chain.get_block_by_hash",
                params: [blockHash],
                Block.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

//
//
    func getBlockByNumber(number: Int, cb: @escaping ApiCallback<Block>) {
        client.call(
                method: "chain.get_block_by_number",
                params: [number],
                Block.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

//
//
    func getBlockInfoByNumber(number: Int, cb: @escaping ApiCallback<BlockInfo>) {
        client.call(
                method: "chain.get_block_info_by_number",
                params: [number],
                BlockInfo.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }

    }

//
//    func getBlockHeaderAndBlockInfoByNumber(number: Int) -> Promise<Any> {
//        // TODO
//       invoke("chain.get_block_info_by_number", [number]);
//    }
//
//    func headerWithDifficultyInfoByNumber(number: Int) -> Any {
//
//    }
//
    func headerByNumber(number: Int, cb: @escaping ApiCallback<Block>) {
        client.call(
                method: "chain.get_block_by_number",
                params: [number],
                Block.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }


    func getBlocksFromNumber(number: Int, count: Int, cb: @escaping ApiCallback<[Block]>) {
        client.call(
                method: "chain.get_blocks_by_number",
                params: [number, count],
                [Block].self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

//
//    func getBalanceOfStc(address: String) -> Promise<Any> {
//        res = this -> listResource(address);
//
//        stcRaw = res['resources']["0x00000000000000000000000000000001::Account::Balance<0x00000000000000000000000000000001::STC::STC>"];
//
//
//    }
//
//
    public func listResource(address: String, cb: @escaping ApiCallback<ListResource>) {
        client.call(
                method: "state.list_resource",
                params: [address],
                ListResource.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

//
//    func getEpochResourceByHeight(height: Int) -> Promise<Any> {
//        h = this -> headerByNumber(height);
//       this -> getEpochResource(h['state_root']);
//    }
//
//    func getEpochResource(stateroot: String,cb: @escaping ApiCallback<EpochResource>) throws{
//        var address = "0x00000000000000000000000000000001";
//        var resType = "0x1::Epoch::Epoch";
//        var opt = GetResourceOption(decode: true, state_root: stateroot)
//        let params:[Codable]
//        params = [address, resType, opt]
//        client.call(
//                method: "state.get_resource",
//                params:params,
//                EpochResource.self,
//                SerializableValue.self
//        ) { response in
//            cb(response.mapError(AvalancheApiError.init).map {
//                $0
//            })
//        }
//    }

//    func getResource(address: String, resType: String, opt: GetResourceOption,cb: @escaping ApiCallback<Resource>) {
//        let params:[Codable]
//        params = [address, resType, opt]
//        client.call(
//                method: "state.get_resource",
//                params:params,
//                Resource.self,
//                SerializableValue.self
//        ) { response in
//            cb(response.mapError(AvalancheApiError.init).map {
//                $0
//            })
//        }
//    }


//    func getAccountSequenceNumber(address: String) -> Promise<Any> {
//
//
//    }
//
//    func getState(address: String) -> Promise<Any> {
//
//    }
//
//    func Subscribe() -> Promise<Any> {
//
//    }
//
//    func NewTxnSendRecvEventNotifications() -> Promise<Any> {
//
//    }
//
//    func NewPendingTransactionsNotifications() -> Promise<Any> {
//
//    }
//
//    func SubmitTransaction() -> Promise<Any> {
//
//    }
//
//
//    func SubmitSignedTransaction() -> Promise<Any> {
//
//    }
//
//    func SubmitSignedTransactionBytes() -> Promise<Any> {
//
//    }
//
//    func transferStc() -> Promise<Any> {
//
//    }
//
//
//    func BuildTransferStcTxn() -> Promise<Any> {
//
//    }
//
//    func BuildRawUserTransaction() -> Promise<Any> {
//
//    }
//
////    func getGasUnitPrice() -> Int {
////       invoke("txpool.gas_price");
////    }
////
////    func callContract() -> Promise<Any> {
////       invoke("contract.call_v2");
////    }
//
//    func EstimateGasByDryRunRaw() -> Promise<Any> {
//
//    }
//
//    func DryRunRaw() -> Promise<Any> {
//
//    }
//
//    func EstimateGas() -> Promise<Any> {
//
//    }
//
//    func DryRun() -> Promise<Any> {
//
//    }
//
//    func DeployContract() -> Promise<Any> {
//
//    }


}