import Foundation

struct EventFilter: Codable {
    var addrs: [String]?
    var type_tags: [String]?
    var from_block: UInt64?
    var to_block: UInt64?
    var event_keys: [String]?
}