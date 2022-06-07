import Foundation
import SwiftJSONRPC
import PromiseKit

class JsonResultParser<ResultType: Codable>: ResultParser {
    func parse(_ object: AnyObject) throws -> ResultType {

        print(object)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(ResultType.self, from: object as! Data)
    }

}

extension RPCService {
    func invoke<Result: Codable>(_ method: String, params: Invocation<Result>.Params? = nil) -> Promise<Result> {
        invoke(method, params: params, parser: JsonResultParser())
    }
}


//class JsonArrayResultParser<Element: Codable>: ResultParser {
//// MARK: Functions
//
//    func parse(_ object: AnyObject) throws -> [Element?] {
//        print(object)
//        guard let value = [Element].deserialize(from: object as! NSArray)
//        else {
//            print(object)
//            return []
//
//            //throw ResultParserError.invalidFormat(object: object)
//        }
//        print(value)
//
//        return []
//    }
//
//}
//
//
//extension RPCService {
//// MARK: Functions
//
//    open func invoke<Element: Codable>(_ method: String, params: Invocation<[Element]>.Params? = nil) -> Promise<[Element?]> {
//        print(method,params)
//        return invoke(method, params: params, parser: JsonArrayResultParser())
//    }
//
//}
