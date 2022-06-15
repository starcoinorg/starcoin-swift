

import Foundation


protocol TransactionPayload {
    func isTransactionPayload()
    func serialize()
    func bcsSerialize()
}

struct ChainId {
    var id: UInt8
}

public struct RawUserTransaction {
    var sender: AccountAddress
    var sequence_number: uint64
    var payload: TransactionPayload
    var max_gas_amount: UInt64
    var gas_unit_price: UInt64
    var gas_token_code: String
    var expiration_timestamp_secs: UInt64
    var chain_id: ChainId

    func bcsSerialize(){

    }

    func serialize(){

    }
}
