import Combine
import Foundation

protocol WeatherSearchViewModel: ObservableObject {
    var state: WeatherSearchState { get }
    var translations: Translations { get }
    var dismissPublisher: AnyPublisher<Void, Never> { get }
    var searchText: String { get set }
    func dismissTapped()
    func locationTapped(_ location: WeatherLocation)
}

final class WeatherSearchViewModelImp {
    @Published var searchText: String = ""
    @Published private(set) var state: WeatherSearchState = .idle

    let translations: Translations
    private let dismissSubject = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()
    private var locationsCancellable: AnyCancellable?

    private let repository: WeatherSearchRepository
    weak var delegate: WeatherSearchModuleDelegate?

    init(
        repository: WeatherSearchRepository,
        translations: Translations
    ) {
        self.repository = repository
        self.translations = translations

        observe()
    }
}

// MARK: Private methods

extension WeatherSearchViewModelImp {
    private func observe() {
        $searchText
            .map { [weak self] text -> String in
                let cleanText = text.trimmingCharacters(in: .whitespaces)
                guard let self = self else { return cleanText }

                if cleanText.isEmpty {
                    self.locationsCancellable = nil
                    self.state = .idle
                }
                return cleanText
            }
            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
            .filter { !$0.isEmpty }
            .sink { [weak self] text in
                self?.fetchLocations(searchText: text)
            }
            .store(in: &cancellables)
    }

    private func fetchLocations(searchText: String) {
        self.state = .loading
        locationsCancellable = repository
            .fetchLocations(query: searchText)
            .sink { [weak self] completion in
                guard case .failure = completion else { return }

                self?.state = .error
            } receiveValue: { [weak self] locations in
                self?.state = locations.isEmpty ? .empty : .data(locations)
            }
    }
}

// MARK: WeatherSearchViewModel

extension WeatherSearchViewModelImp: WeatherSearchViewModel {
    var dismissPublisher: AnyPublisher<Void, Never> {
        dismissSubject.eraseToAnyPublisher()
    }

    func dismissTapped() {
        dismissSubject.send()
    }

    func locationTapped(_ location: WeatherLocation) {
        delegate?.didSelectLocation(location)
        dismissSubject.send()
    }
}

