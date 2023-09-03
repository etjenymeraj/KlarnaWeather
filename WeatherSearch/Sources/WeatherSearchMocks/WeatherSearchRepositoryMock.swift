@testable import WeatherSearch
import Combine
import Utilities
import Foundation

public final class WeatherSearchRepositoryMock: WeatherSearchRepository {
    public init() {}
    public var stubWeatherLocatons: [WeatherLocation]?
    private(set) public var didCallFetchLocations = false
    public func fetchLocations(query: String) -> AnyPublisher<[WeatherLocation], Error> {
        didCallFetchLocations = true
        guard let stubWeatherLocatons else {
            return Fail(error: NSError(domain: "", code: 0))
                .eraseToAnyPublisher()
        }

        return Just(stubWeatherLocatons)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
