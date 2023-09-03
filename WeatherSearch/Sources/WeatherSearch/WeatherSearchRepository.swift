import Combine
import NetworkService
import Foundation

protocol WeatherSearchRepository {
    func fetchLocations(query: String) -> AnyPublisher<[WeatherLocation], Error>
}

final class WeatherSearchRepositoryImp {
    let requests: APIRequests

    init(requests: APIRequests) {
        self.requests = requests
    }
}

// MARK: Private methods

extension WeatherSearchRepositoryImp {
    private func mapToWeatherLocation(response: GeocodingResponse) -> WeatherLocation {
        WeatherLocation(
            name: response.name,
            latitude: response.latitude,
            longitude: response.longitude,
            country: response.country,
            state: response.state
        )
    }

    private enum RepositoryError: Error {
        case runtimeError
    }
}

// MARK: WeatherSearchRepository

extension WeatherSearchRepositoryImp: WeatherSearchRepository {
    func fetchLocations(query: String) -> AnyPublisher<[WeatherLocation], Error> {
        requests
            .geocoding(args: GeocodingEndpointArgs(name: query))
            .tryMap { [weak self] response in
                guard let self else {
                    throw RepositoryError.runtimeError
                }

                return response.map { self.mapToWeatherLocation(response: $0) }
            }
            .eraseToAnyPublisher()
    }
}
