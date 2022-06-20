import Foundation


struct Proof: Codable {
    var siblings: [String]?
}

struct EventProof: Codable {
    var event: String?
    var proof: Proof?
}