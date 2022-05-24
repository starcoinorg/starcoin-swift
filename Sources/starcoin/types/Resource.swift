
import Foundation
import HandyJSON

struct ListResource: HandyJSON {
    var resources: String?
}

struct Resource: HandyJSON {
    var raw: String?
}

struct GetResourceOption:Codable {
    var decode: Bool
    var state_root: String
}

struct EpochJson: HandyJSON {
    var number: UInt64?
    var start_time: UInt64?
    var start_block_number: UInt64?
    var end_block_number: UInt64?
    var block_time_target: UInt64?
    var reward_per_block: UInt64?
    var reward_per_uncle_percent: UInt64?
    var block_difficulty_window: UInt?
    var max_uncles_per_block: UInt?
    var block_gas_limit: UInt64?
    var strategy: UInt?
    var new_epoch_events: NewEpochEvents?
}

struct NewEpochEvents: HandyJSON {
    var counter: UInt64?
    var guid: String?
}


struct EpochResource:HandyJSON {
    var json: EpochJson?
    var raw:String?
}