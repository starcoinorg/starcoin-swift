

import Foundation
import JsonRPC
import Serializable
import Serde

extension RPC{
   public func getAccountState(address:String,cb: @escaping ApiCallback<AccountResource>){
        client.call(
                method: "state.get_account_state",
                params: [address],
                AccountResource.self,
                SerializableValue.self
        ) { response in


            // TODO BcsDeserializeAccountResource
            cb(response.mapError(ApiError.init).map {
                $0
            })
        }
    }


}