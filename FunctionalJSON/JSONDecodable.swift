public protocol JSONDecodable {
    static func decode(json: JSON) -> Self?
}
