import Foundation

struct APIRequestFactory {
    private func makeURL(for endpoint: Endpoint) -> URL? {
        var components = URLComponents()
        components.scheme = "\(APIConstants.schema)"
        components.host = "\(APIConstants.base)"
        components.path = "\(endpoint.path)"
    
        if endpoint.method == .get {
            components.queryItems = endpoint.parameters.map {
                URLQueryItem(
                    name: $0.key,
                    value: String(describing: $0.value)
                )
            }
        }

        return components.url
    }

    func makeRequest(endpoint: Endpoint) -> URLRequest? {
        guard let url = makeURL(for: endpoint) else {
            return nil
        }
    
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = (endpoint.method != .get)
            ? try? JSONSerialization.data(
                withJSONObject: endpoint.parameters,
                options: .prettyPrinted)
            : nil
    
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
