import SwiftUI
import NetworkService
import Utilities
import DesignComponents
import WeatherSearch

public protocol CurrentWeatherViewModuleFactory {
    associatedtype SomeView: View

    func make() -> SomeView
}

public final class CurrentWeatherViewModuleFactoryImp {
    public init() {}
}

// MARK: CurrentWeatherViewModuleFactory

extension CurrentWeatherViewModuleFactoryImp: CurrentWeatherViewModuleFactory {
    public func make() -> some View {
        let requests = APIRequestsImp()
        let locationProvider = LocationProviderImp()
        let repository = CurrentWeatherRepositoryImp(requests: requests)
        let viewModel = CurrentWeatherViewModelImp<WeatherViewModelImp>(
            repository: repository,
            locationProvider: locationProvider,
            translations: .default
        )
        let router = CurrentWeatherRouterImp(weatherSearchFactory: WeatherSearchViewModuleFactoryImp())
        router.weatherSearchDelegate = viewModel
        let components = ComponentsFactory()
        let view = CurrentWeatherView(
            componentsFactory: components,
            viewModel: viewModel,
            router: router
        )
        return view
    }
}
