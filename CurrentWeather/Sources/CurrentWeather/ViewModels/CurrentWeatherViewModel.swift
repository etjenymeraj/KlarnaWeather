import Combine
import Utilities
import Foundation
import WeatherSearch

protocol CurrentWeatherViewModel: ObservableObject {
    associatedtype SomeWeatherViewModel: WeatherViewModel

    var state: CurrentWeatherState<SomeWeatherViewModel> { get }
    var shouldShowPermissionAlert: Bool { get set }
    var shouldShowWeatherSearch: Bool { get set }
    var translations: Translations { get }
    var settingsPublisher: AnyPublisher<Void, Never> { get }
    func retryWeatherTapped()
    func goToSettingsTapped()
    func searchTapped()
}

final class CurrentWeatherViewModelImp<SomeWeatherViewModel: WeatherViewModel> {
    @Published private(set) var state: CurrentWeatherState<SomeWeatherViewModel> = .loading
    @Published var shouldShowPermissionAlert = false
    @Published var shouldShowWeatherSearch = false

    let translations: Translations
    private let settingsSubject = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()

    private let repository: CurrentWeatherRepository
    private let locationProvider: LocationProvider

    init(
        repository: CurrentWeatherRepository,
        locationProvider: LocationProvider,
        translations: Translations
    ) {
        self.repository = repository
        self.locationProvider = locationProvider
        self.translations = translations

        observe()
    }
}

// MARK: Private methods

extension CurrentWeatherViewModelImp {
    private func observe() {
        locationProvider
            .permissionGrantedPublisher
            .sink { [weak self] granted in
                self?.shouldShowPermissionAlert = !granted
            }
            .store(in: &cancellables)

        locationProvider
            .currentLocationPublisher
            .sink { [weak self] location in
                self?.fetchCurrentWeather(location: location)
            }
            .store(in: &cancellables)
    }

    private func fetchCurrentWeather(location: UserLocation) {
        repository
            .fetchCurrentWeather(location: location)
            .sink { [weak self] completion in
                guard case .failure = completion else { return }

                self?.state = .error
            } receiveValue: { [weak self] weather in
                guard let weatherViewModel = WeatherViewModelImp(
                        weather: weather
                    ) as? SomeWeatherViewModel
                else { return }

                self?.state = .data(weatherViewModel)
            }
            .store(in: &cancellables)
    }
}

// MARK: CurrentWeatherViewModel

extension CurrentWeatherViewModelImp: CurrentWeatherViewModel {
    var settingsPublisher: AnyPublisher<Void, Never> {
        settingsSubject.eraseToAnyPublisher()
    }

    func retryWeatherTapped() {
        guard let lastLocation = locationProvider.lastLocation else { return }

        fetchCurrentWeather(location: lastLocation)
    }

    func goToSettingsTapped() {
        settingsSubject.send()
    }

    func searchTapped() {
        shouldShowWeatherSearch = true
    }
}

// MARK: WeatherSearchDelegate

extension CurrentWeatherViewModelImp: WeatherSearchModuleDelegate {
    func didSelectLocation(_ location: WeatherSearch.WeatherLocation) {
        let userLocation = UserLocation(latitude: location.latitude, longitude: location.longitude)
        state = .loading
        fetchCurrentWeather(location: userLocation)
    }
}
