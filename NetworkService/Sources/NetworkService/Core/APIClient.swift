import Foundation
import Combine

protocol APIClient {
    func request<T: Decodable>(
        from endpoint: Endpoint,
        responseType: T.Type
    ) -> AnyPublisher<T, Error>
}

final class APIClientImp {
    private let session: URLSession
    private let factory: APIRequestFactory

    init(
        session: URLSession = .shared,
        factory: APIRequestFactory = .init()
    ) {
        self.session = session
        self.factory = factory
    }
}

// MARK: APIClient

extension APIClientImp: APIClient {
    func request<T: Decodable>(
        from endpoint: Endpoint,
        responseType: T.Type
    ) -> AnyPublisher<T, Error> {
        do {
            let request = try factory
                .makeRequest(endpoint: endpoint)
                .orThrow(APIError.cannotBuildRequest)
      
            return session.dataTaskPublisher(for: request)
                .tryMap { element -> Data in
                    let _ = try (element.response as? HTTPURLResponse)
                        .matching { $0.statusCode == 200 }
                        .orThrow(APIError.badServerResponse)

                    return element.data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
}
