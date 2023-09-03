enum CurrentWeatherState<ViewModel: WeatherViewModel> {
    case loading
    case error
    case data(ViewModel)
}

// MARK: Equatable

extension CurrentWeatherState: Equatable {}
