//
// Created by mac on 2022/5/24.
//

import Foundation
import HandyJSON

struct Proof: HandyJSON {
    var siblings: [String]?
}

struct EventProof: HandyJSON {
    var event: String?
    var proof: Proof?
}