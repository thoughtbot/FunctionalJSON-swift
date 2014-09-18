import Foundation

public typealias JSON = AnyObject
public typealias JSONObject = [String:AnyObject]
public typealias JSONArray = [AnyObject]

func _JSONParse<A>(object: JSON) -> A? {
  return object as? A
}

func decodeJSON(data: NSData) -> Result<JSON> {
    let jsonOptional: JSON! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)
    return resultFromOptional(jsonOptional, NSError()) // use the error from NSJSONSerialization or a custom error message
}

func decodeObject<U: JSONDecodable>(json: JSON) -> Result<U> {
    return resultFromOptional(U.decode(json), NSError())
}
