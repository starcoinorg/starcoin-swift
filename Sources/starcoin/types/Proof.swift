
import Foundation
import HandyJSON

struct Proof: HandyJSON {
    var siblings: [String]?
}

struct EventProof: HandyJSON {
    var event: String?
    var proof: Proof?
}