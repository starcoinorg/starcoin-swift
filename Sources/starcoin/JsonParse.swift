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
        return invoke(method, params: params, parser: JsonResultParser())
    }
}