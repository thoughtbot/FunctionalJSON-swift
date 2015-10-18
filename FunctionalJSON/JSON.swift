import Foundation

public typealias JSON = AnyObject
public typealias JSONObject = [String:AnyObject]
public typealias JSONArray = [AnyObject]

func _JSONParse<A>(object: JSON) -> A? {
  return object as? A
}

func decodeJSON(data: NSData) -> Result<JSON> {
    let jsonOptional: JSON!
    var __error: NSError!
    
    do {
        jsonOptional = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
    }catch let caught as NSError {
        __error = caught
        jsonOptional = []
    }
    
    
    return resultFromOptional(jsonOptional, error: __error)
}

func decodeObject<U: JSONDecodable>(json: JSON) -> Result<U> {
    return resultFromOptional(U.decode(json), error: NSError(domain: "<Your domain>", code: 1, userInfo: nil))
}
