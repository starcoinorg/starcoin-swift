//
//  ApiCommon.swift
//  
//
//  Created by Daniel Leping on 27/12/2020.
//

import Foundation
import Serializable
import JsonRPC

public enum AvalancheApiError: Error {
    case networkService(error: ServiceError)
    case networkBodyIsEmpty
    case networkReply(method: String, params: Any,
                      error: ResponseError<SerializableValue>)
    case custom(description: String? = nil, cause: Error?)
    case malformed(field: String, description: String)
    case cb58DecodingFailed(field: String)
    case unsupportedEncoding(encoding: String)
    case addressNotFound(address: String)
    case methodIsNotSupported(method: String)
    case nilAddressManager
    case nilSignatureProvider
    case nilAvalancheApi
    
    public init<P: Encodable>(request: RequestError<P, SerializableValue>) {
        switch request {
        case .custom(description: let d, cause: let c):
            self = .custom(description: d, cause: c)
        case .empty:
            self = .networkBodyIsEmpty
        case .reply(method: let m, params: let p, error: let e):
            self = .networkReply(method: m, params: p, error: e)
        case .service(error: let e):
            self = .networkService(error: e)
        }
    }
}

public typealias ApiCallback<R> = (Result<R, AvalancheApiError>) -> Void

public enum ApiDataEncoding: String, Encodable, Decodable {
    public typealias RawValue = String
    
    case cb58 = "cb58"
    case hex = "hex"
}

public struct UTXOIndex: Codable, Equatable {
    public let address: String
    public let utxo: String
}

extension CodingUserInfoKey {
    public static let avaDataEncoding = CodingUserInfoKey(rawValue: "AvalancheDataEncoding")!
}

struct SuccessResponse: Decodable {
    let success: Bool
    
    func toResult() -> Result<Void, AvalancheApiError> {
        success ? .success(()) : .failure(.custom(description: "Service returned success = false", cause: nil))
    }
}
