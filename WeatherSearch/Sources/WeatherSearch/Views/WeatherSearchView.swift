import SwiftUI
import DesignComponents

struct WeatherSearchView<ViewModel: WeatherSearchViewModel>: View {
    let componentsFactory: ComponentsFactory
    @StateObject var viewModel: ViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Colors.primaryBackgroundColor.ignoresSafeArea()
                switch viewModel.state {
                case .idle:
                    WeatherSearchIdleView(
                        componentsFactory: componentsFactory,
                        translations: viewModel.translations
                    )
                    .padding(.horizontal, 16)
                case .loading:
                    WeatherSearchLoadingView()
                case .error:
                    WeatherSearchErrorView(
                        componentsFactory: componentsFactory,
                        translations: viewModel.translations
                    )
                    .padding(.horizontal, 16)
                case .empty:
                    WeatherSearchEmptyView(
                        componentsFactory: componentsFactory,
                        translations: viewModel.translations
                    )
                    .padding(.horizontal, 16)
                case .data(let locations):
                    WeatherSearchDataView(
                        componentsFactory: componentsFactory,
                        locations: locations
                    ) { location in
                        viewModel.locationTapped(location)
                    }
                }
            }
            .navigationTitle(viewModel.translations.title)
            .searchable(text: $viewModel.searchText)
            .toolbar {
                DismissButtonView(
                    componentsFactory: componentsFactory,
                    title: viewModel.translations.buttonTitle,
                    action: viewModel.dismissTapped
                )
            }
            .onReceive(viewModel.dismissPublisher) { _ in
                dismiss()
            }
        }
    }
}
