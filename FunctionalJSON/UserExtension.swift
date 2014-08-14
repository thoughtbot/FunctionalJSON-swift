import Foundation

extension User: JSONDecodable {
    static func create(id: Int)(name: String)(email: String) -> User {
        return User(id: id, name: name, email: email)
    }

    static func decode(json: JSON) -> User? {
        return _JSONObject(json) >>> { d in
            User.create <^>
                d["id"]     >>> _JSONInt    <*>
                d["name"]   >>> _JSONString <*>
                d["email"]  >>> _JSONString
        }
    }
}
