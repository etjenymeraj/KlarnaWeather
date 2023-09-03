@testable import CurrentWeather
import Combine
import Utilities
import Foundation

public final class CurrentWeatherRepositoryMock: CurrentWeatherRepository {
    public init() {}
    public var stubWeather: Weather?
    private(set) public var didCallCurrentWeather = false
    public func fetchCurrentWeather(location: UserLocation) -> AnyPublisher<Weather, Error> {
        didCallCurrentWeather = true
        guard let stubWeather else {
            return Fail(error: NSError(domain: "", code: 0))
                .eraseToAnyPublisher()
        }

        return Just(stubWeather)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
