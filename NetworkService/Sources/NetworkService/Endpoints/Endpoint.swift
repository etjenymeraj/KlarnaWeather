protocol Endpoint {
    var path: String { get }
    var method: Method { get }
    var headers: [String: String] { get }
    var parameters: [String: String] { get }
}

extension Endpoint {
    var headers: [String: String] {
        [:]
    }

    var parameters: [String: Any] {
        [:]
    }
}

enum Method: String {
    case get, post, put, delete
}
