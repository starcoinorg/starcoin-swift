import Foundation
import JsonRPC
import Serializable
import Serde

// Allow simple string errors
extension String: Error {
}

extension String {
    typealias Byte = UInt8
    var hexToBytes: [Byte] {
        var start = startIndex
        return stride(from: 0, to: count, by: 2).compactMap { _ in   // use flatMap for older Swift versions
            let end = index(after: start)
            defer { start = index(after: end) }
            return Byte(self[start...end], radix: 16)
        }
    }

    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .init(rawValue: 0))
    }
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


    public func getTransactionProof(blockHash: String, txGlobalIndex: Int, eventIndex: Int,
                                    cb: @escaping ApiCallback<TransactionProof>) {
        client.call(
                method: "chain.get_transaction_proof",
                params: Params(blockHash, txGlobalIndex, eventIndex),
                TransactionProof.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

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
    func getBalanceOfStc(address: String, cb: @escaping ApiCallback<UInt128>) {
        let resType = "0x00000000000000000000000000000001::Account::Balance<0x00000000000000000000000000000001::STC::STC>"
        let opt = GetResourceOption(decode: false)
        getResource(address: address, resType: resType, opt: opt) { result in
            var info = try! result.get()
            print(info.raw)
            let range = info.raw.index(info.raw.startIndex, offsetBy: 0)...info.raw.index(info.raw.startIndex, offsetBy: 1)
            info.raw.replaceSubrange(range, with: "")
            let bcs = BcsDeserializer(input: [UInt8](info.raw.hexToBytes))
            let amount = try! bcs.deserialize_u128()
            cb(Result.success(amount))
        }
    }

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
    public func getEpochResource(stateRoot: String, cb: @escaping ApiCallback<EpochResource>) {
        let address = "0x00000000000000000000000000000001";
        let resType = "0x1::Epoch::Epoch";
        let opt = GetResourceOption(decode: true, state_root: stateRoot)
        client.call(
                method: "state.get_resource",
                params: Params(address, resType, opt),
                EpochResource.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

    public func getResource(address: String, resType: String, opt: GetResourceOption, cb: @escaping ApiCallback<Resource>) {
        client.call(
                method: "state.get_resource",
                params: Params(address, resType, opt),
                Resource.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }


//    func getAccountSequenceNumber(address: String) -> Promise<Any> {
//
//
//    }
//

    func getState(address: String, cb: @escaping ApiCallback<AccountResource>) {
        client.call(
                method: "state.get",
                params: [address + "/1/0x00000000000000000000000000000001::Account::Account"],
                AccountResource.self,
                SerializableValue.self
        ) { response in
            // TODO BcsDeserializeAccountResource
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }

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
    func SubmitTransaction(privateKey: Ed25519PrivateKey, rawUserTransaction: RawUserTransaction) {
        client.call(
                method: "txpool.submit_hex_transaction",
                params: ["xxx"],
                Resource.self,
                SerializableValue.self
        ) { response in
//            cb(response.mapError(ApiError.init).map {
//                $0
//            })
        }
    }

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
    public func getGasUnitPrice(cb: @escaping ApiCallback<Int>) {
        client.call(
                method: "txpool.gas_price",
                params: Nil.nil,
                String.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(ApiError.init).map {
                Int($0) ?? 1
            })
        }
    }

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