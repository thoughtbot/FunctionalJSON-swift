import Foundation

extension User: JSONDecodable {
    static func create(id: Int)(name: String)(email: String?) -> User {
        return User(id: id, name: name, email: email)
    }

    public static func decode(json: JSON) -> User? {
      return _JSONParse(json) >>> { d in
            User.create
              <^> d <|  "id"
              <*> d <|  "name"
              <*> d <|* "email"
        }
    }
}
