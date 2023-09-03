import Combine

public protocol APIRequests {
    func currentWeather(args: CurrentWeatherEndpointArgs) -> AnyPublisher<CurrentWeatherResponse, Error>
    func geocoding(args: GeocodingEndpointArgs) -> AnyPublisher<[GeocodingResponse], Error>
}

public class APIRequestsImp {
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    public convenience init() {
        self.init(apiClient: APIClientImp())
    }
}

// MARK: APIRequests

extension APIRequestsImp: APIRequests {
    public func currentWeather(args: CurrentWeatherEndpointArgs) -> AnyPublisher<CurrentWeatherResponse, Error> {
        apiClient.request(
            from: CurrentWeatherEndpoint(args: args),
            responseType: CurrentWeatherResponse.self
        )
    }

    public func geocoding(args: GeocodingEndpointArgs) -> AnyPublisher<[GeocodingResponse], Error> {
        apiClient.request(
            from: GeocodingEndpoint(args: args),
            responseType: [GeocodingResponse].self
        )
    }
}
