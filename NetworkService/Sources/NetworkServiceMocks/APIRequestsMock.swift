import NetworkService
import Combine
import Foundation

public final class APIRequestsMock: APIRequests {
    public init() {}

    public private(set) var didCallCurrentWeather: Bool = false
    public var stubCurrentWeatherResponse: CurrentWeatherResponse?
    public func currentWeather(args: CurrentWeatherEndpointArgs) -> AnyPublisher<CurrentWeatherResponse, Error> {
        didCallCurrentWeather = true
        guard let stubCurrentWeatherResponse else {
            return Fail(error: NSError(domain: "", code: 0))
                .eraseToAnyPublisher()
        }

        return Just(stubCurrentWeatherResponse)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public private(set) var didCallGeocoding: Bool = false
    public var stubGeocodingResponse: [GeocodingResponse]?
    public func geocoding(args: GeocodingEndpointArgs) -> AnyPublisher<[GeocodingResponse], Error> {
        didCallGeocoding = true
        guard let stubGeocodingResponse else {
            return Fail(error: NSError(domain: "", code: 0))
                .eraseToAnyPublisher()
        }

        return Just(stubGeocodingResponse)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
