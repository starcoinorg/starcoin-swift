import Foundation
import SwiftJSONRPC
import HandyJSON


struct AccumulatorInfo: HandyJSON {
    var accumulator_root: String?
    var frozen_subtree_roots: [String]?
    var num_leaves: String?
    var num_nodes: String?
}


struct BlockInfo: HandyJSON {
    var block_hash: String?
    var total_difficulty: String?
    var txn_accumulator_info: AccumulatorInfo?
    var block_accumulator_info: AccumulatorInfo?
}

struct BlockHeader: HandyJSON {
    var timestamp: String?
    var author: String?
    var author_auth_key: String?
    var block_accumulator_root: String?
    var block_hash: String?
    var body_hash: String?
    var chain_id: Int?
    var difficulty: String?
    var difficulty_number: UInt64?
    var extra: String?
    var gas_used: String?
    var Nonce: UInt64?
    var number: String?
    var parent_hash: String?
    var state_root: String?
    var txn_accumulator_root: String?


}


struct ChainInfo: HandyJSON {
    var chain_id: Int?
    var genesis_hash: String?
    var head: BlockHeader?
    var block_info: BlockInfo?
}

struct PeerInfo: HandyJSON {

    var peer_id: String?
    var notif_protocols: String?
    var rpc_protocols: String?
    var chain_info: ChainInfo?
}


class NodeInfo: HandyJSON {
    required init() {
        net = ""
        self_address = ""
        now_seconds = 0
    }

    var net: String?
    var now_seconds: Int
    var self_address: String?
    var peer_info: PeerInfo?

}

