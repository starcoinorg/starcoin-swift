import Foundation
import SwiftJSONRPC
import PromiseKit
import HandyJSON

class JsonResultParser<ResultType: HandyJSON>: ResultParser {
    func parse(_ object: AnyObject) throws -> ResultType {
        print(object)
        guard let value = ResultType.deserialize(from: object as! NSDictionary) else {
            throw ResultParserError.invalidFormat(object: object)
        }
        return value
    }

}

extension RPCService {
    func invoke<Result: HandyJSON>(_ method: String, params: Invocation<Result>.Params? = nil) -> Promise<Result> {
        invoke(method, params: params, parser: JsonResultParser())
    }
}


class JsonArrayResultParser<Element: HandyJSON>: ResultParser {
// MARK: Functions

    func parse(_ object: AnyObject) throws -> [Element?] {
        print(object)
        guard let value = [Element].deserialize(from: object as! NSArray) else {
            throw ResultParserError.invalidFormat(object: object)
        }
        return value
    }

}


extension RPCService {
// MARK: Functions

    open func invoke<Element: HandyJSON>(_ method: String, params: Invocation<[Element]>.Params? = nil) -> Promise<[Element?]> {
        return invoke(method, params: params, parser: JsonArrayResultParser())
    }

}
