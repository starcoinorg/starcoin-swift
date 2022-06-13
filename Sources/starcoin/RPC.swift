//
// Created by mac on 2022/6/13.
//

import Foundation
import JsonRPC
import Serializable

// Allow simple string errors
extension String: Error {
}

// Notification body structure
struct NewHeadsNotification: Decodable {
    let subscription: String
    let result: SerializableValue
}

class RPC {

    private let client: Client;
    public init(url: String) {
       client  = JsonRpc(.http(url: URL(string:url)!), queue: .main)
    }

    public func nodeInfo(cb: @escaping ApiCallback<NodeInfo>) {
        client.call(
                method: "node.info",
                params: Nil.nil,
                NodeInfo.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(AvalancheApiError.init).map {$0})
        }
    }


    public func getEvents(eventFilter: EventFilter, cb: @escaping ApiCallback<Event>) -> [Event] {
        client.call(
                method: "chain.get_events",
                params: Nil.nil,
                NodeInfo.self,
                SerializableValue.self
        ) { response in
            cb(response.mapError(AvalancheApiError.init).map {
                $0
            })
        }
    }


}