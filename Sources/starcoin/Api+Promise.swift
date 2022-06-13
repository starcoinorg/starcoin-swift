//
//  Api+Promise.swift
//  
//
//  Created by Ostap Danylovych on 25.01.2022.
//

import Foundation
#if !COCOAPODS
import PromiseKit
#endif

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
