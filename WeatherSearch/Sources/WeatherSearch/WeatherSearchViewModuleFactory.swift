import SwiftUI
import NetworkService
import DesignComponents

public protocol WeatherSearchViewModuleFactory {
    associatedtype SomeView: View

    func make(delegate: WeatherSearchModuleDelegate?) -> SomeView
}

public final class WeatherSearchViewModuleFactoryImp {
    public init() {}
}

// MARK: WeatherSearchViewModuleFactory

extension WeatherSearchViewModuleFactoryImp: WeatherSearchViewModuleFactory {
    public func make(delegate: WeatherSearchModuleDelegate?) -> some View {
        let requests = APIRequestsImp()
        let repository = WeatherSearchRepositoryImp(requests: requests)
        let viewModel = WeatherSearchViewModelImp(
            repository: repository,
            translations: .default
        )
        viewModel.delegate = delegate
        let components = ComponentsFactory()
        let view = WeatherSearchView(
            componentsFactory: components,
            viewModel: viewModel
        )
        return view
    }
}
