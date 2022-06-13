
import Foundation
import PromiseKit

extension Promise {
    public func asCallback(_ cb: @escaping ApiCallback<T>) {
        pipe { res in
            switch res {
            case .fulfilled(let result):
                cb(.success(result))
            case .rejected(let error):
                cb(.failure(.custom(cause: error)))
            }
        }
    }
}
