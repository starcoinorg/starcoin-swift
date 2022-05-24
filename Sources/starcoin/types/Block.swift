import Foundation
import HandyJSON

struct Block: HandyJSON {
    var header: BlockHeader?
    var body: BlockBody?
    var uncles: [BlockHeader]?
}


struct BlockBody: HandyJSON {
    var full: [UserTransaction]?
}

struct UserTransaction: HandyJSON {
    var transaction_hash: String?
    var raw_txn: RawTransaction?
    var authenticator: Authenticator?
}


struct RawTransaction: HandyJSON {
    var sender: String?
    var sequence_number: String?
    var payload: String?
    var max_gas_amount: String?
    var gas_unit_price: String?
    var gas_token_code: String?
    var expiration_timestamp_secs: String?
    var chain_id: Int?
}

struct Authenticator: HandyJSON {
    var Ed25519: Ed25519?
}


struct Ed25519: HandyJSON {
    var public_key: String?
    var signature: String?
}