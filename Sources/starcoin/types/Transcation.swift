import Foundation

struct Transaction: Codable {
    var block_hash: String?
    var block_number: String?
    var transaction_hash: String?
    var transaction_index: Int?
    var block_metadata: BlockMetadata?
    var user_transaction: UserTransaction?
}


struct BlockMetadata: Codable {
    var author: String?
    var chain_id: Int?
    var number: String?
    var parent_gas_used: Int?
    var parent_hash: String?
    var timestamp: Int64?
    var uncles: String?
}

struct PendingTransaction: Codable {
    var authenticator: Authenticator?
    var raw_txn: RawTransaction?
    var timestamp: Int64?
    var transaction_hash: String?
}


struct TransactionInfo: Codable {
    var block_hash: String?
    var block_number: String?
    var transaction_hash: String?
    var transaction_index: Int?
    var transaction_global_index: String?
    var state_root_hash: String?
    var event_root_hash: String?
    var gas_used: String?
    // TODO?
    var status: String?
}


struct Event: Codable {
    var block_hash: String?
    var block_number: String?
    var transaction_hash: String?
    var transaction_index: Int?
    var data: String?
    var type_tag: String?
    var event_key: String?
    var event_seq_number: String?
    var transaction_global_index: String?
    var event_index: Int?

}

struct TransactionProof: Codable {
    var transaction_info: TransactionInfo?
    var proof: Proof?
    var event_proof: EventProof?
    var state_proof: String?
}