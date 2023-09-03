import WeatherSearch
import SwiftUI

protocol CurrentWeatherRouter {
    associatedtype SomeWeatherSearchView: View

    func makeWeatherSearch() -> SomeWeatherSearchView
}

final class CurrentWeatherRouterImp<WeatherSearchFactory: WeatherSearchViewModuleFactory> {
    private let weatherSearchFactory: WeatherSearchFactory

    weak var weatherSearchDelegate: WeatherSearchModuleDelegate?

    init(weatherSearchFactory: WeatherSearchFactory) {
        self.weatherSearchFactory = weatherSearchFactory
    }
}

// MARK: CurrentWeatherRouter

extension CurrentWeatherRouterImp: CurrentWeatherRouter {
    func makeWeatherSearch() -> some View {
        weatherSearchFactory.make(delegate: weatherSearchDelegate)
    }
}
