@testable import NetworkService
import Combine
import Foundation

public final class APIClientMock: APIClient {
    public init() {}

    public private(set) var didCallRequest = false
    public var stubResponse: Any?
    public func request<T: Decodable>(from endpoint: Endpoint, responseType: T.Type) -> AnyPublisher<T, Error> {
        didCallRequest = true
        guard let stubResponse = stubResponse as? T else {
            return Fail(error: NSError(domain: "", code: 0))
                .eraseToAnyPublisher()
        }
        
        return Just(stubResponse)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
