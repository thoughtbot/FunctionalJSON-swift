import Foundation

enum Result<A> {
    case Error(NSError)
    case Value(Box<A>)

    init(_ error: NSError?, _ value: A) {
        if let err = error {
            self = .Error(err)
        } else {
            self = .Value(Box(value))
        }
    }
}

func resultFromOptional<A>(optional: A?, error: NSError) -> Result<A> {
    if let a = optional {
        return .Value(Box(a))
    } else {
        return .Error(error)
    }
}

final class Box<T> {
    let value: T

    init(_ value: T) {
        self.value = value
    }
}
