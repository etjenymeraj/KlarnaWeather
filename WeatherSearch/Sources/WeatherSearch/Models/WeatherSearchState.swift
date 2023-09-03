enum WeatherSearchState {
    case idle
    case loading
    case empty
    case error
    case data([WeatherLocation])
}

// MARK: Equatable

extension WeatherSearchState: Equatable {}
