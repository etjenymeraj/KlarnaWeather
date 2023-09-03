import Combine
import NetworkService
import Utilities
import Foundation

protocol CurrentWeatherRepository {
    func fetchCurrentWeather(location: UserLocation) -> AnyPublisher<Weather, Error>
}

final class CurrentWeatherRepositoryImp {
    let requests: APIRequests

    init(requests: APIRequests) {
        self.requests = requests
    }
}

// MARK: Private methods

extension CurrentWeatherRepositoryImp {
    private func mapToWeather(response: CurrentWeatherResponse) -> Weather {
        let location = WeatherLocation(name: response.name)
        let condition = response.conditions.first.map {
            WeatherCondition(
                title: $0.title,
                description: $0.description
            )
        }
        let temperature = WeatherTemperature(
            actual: response.temperature.actual,
            min: response.temperature.min,
            max: response.temperature.max,
            humidity: response.temperature.humidity
        )
        let wind = WeatherWind(speed: response.wind.speed)
        let data = WeatherData(
            sunrise: response.system.sunrise,
            sunset: response.system.sunset
        )
        let weather = Weather(
            location: location,
            condition: condition,
            temperature: temperature,
            wind: wind,
            data: data
        )
        return weather
    }

    private enum RepositoryError: Error {
        case runtimeError
    }
}

// MARK: CurrentWeatherRepository

extension CurrentWeatherRepositoryImp: CurrentWeatherRepository {
    func fetchCurrentWeather(location: UserLocation) -> AnyPublisher<Weather, Error> {
        requests
            .currentWeather(args: CurrentWeatherEndpointArgs(
                latitude: location.latitude,
                longitude: location.longitude,
                unitTemperature: UnitTemperature(forLocale: .current)
            ))
            .tryMap { [weak self] response in
                guard let self else {
                    throw RepositoryError.runtimeError
                }

                return self.mapToWeather(response: response)
            }
            .eraseToAnyPublisher()
    }
}
