import SwiftUI
import DesignComponents

struct CurrentWeatherView<
    ViewModel: CurrentWeatherViewModel,
    Router: CurrentWeatherRouter
>: View {
    let componentsFactory: ComponentsFactory
    @StateObject var viewModel: ViewModel
    let router: Router
    @Environment(\.openURL) private var openURL

    var body: some View {
        ZStack {
            Colors.primaryBackgroundColor.ignoresSafeArea()

            switch viewModel.state {
            case .loading:
                contentView(weather: PlaceholderWeatherViewModel())
                    .redacted(reason: .placeholder)
            case .error:
                WeatherErrorView(
                    componentsFactory: componentsFactory,
                    translations: viewModel.translations,
                    action: viewModel.retryWeatherTapped
                )
                .padding(.horizontal, 16)
            case .data(let weather):
                contentView(weather: weather)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .modifier(componentsFactory.viewModifier.makeToast(
            config: ToastConfig(
                isPresented: $viewModel.shouldShowPermissionAlert,
                image: Image(systemName: "exclamationmark.triangle.fill"),
                title: viewModel.translations.toastTitle,
                buttonText: viewModel.translations.toastButtonTitle,
                buttonAction: viewModel.goToSettingsTapped
        )))
        .onReceive(viewModel.settingsPublisher) { _ in
            openURL(URL(string: UIApplication.openSettingsURLString)!)
        }
        .fullScreenCover(isPresented: $viewModel.shouldShowWeatherSearch) {
            router.makeWeatherSearch()
        }
    }

    private func contentView<VM: WeatherViewModel>(weather: VM) -> some View {
        VStack {
            VStack(spacing: 16) {
                WeatherLocationView(weather: weather)
                WeatherTemperatureView(
                    components: componentsFactory,
                    weather: weather
                )
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)

            Spacer()
            
            componentsFactory
                .image
                .makeIcon(config: .init(
                    image: Image("background", bundle: .module),
                    width: 300, height: 150)
                )

            Spacer()

            WeatherStatsView(
                componentsFactory: componentsFactory,
                weather: weather,
                translations: viewModel.translations,
                action: viewModel.searchTapped
            )
        }
    }
}
