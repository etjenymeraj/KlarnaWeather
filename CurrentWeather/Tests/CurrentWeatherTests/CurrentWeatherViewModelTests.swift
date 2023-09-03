@testable import CurrentWeather
import UtilitiesMocks
import CurrentWeatherMocks
import XCTest
import Combine

final class CurrentWeatherViewModelTests: XCTestCase {
    private var subjectUnderTest: CurrentWeatherViewModelImp<WeatherViewModelImp>!
    private var repositoryMock: CurrentWeatherRepositoryMock!
    private var locationProviderMock: LocationProviderMock!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        repositoryMock = CurrentWeatherRepositoryMock()
        locationProviderMock = LocationProviderMock()
        setupViewModel()
    }

    override func tearDown() {
        subjectUnderTest = nil
        repositoryMock = nil
        locationProviderMock = nil
        cancellables.forEach { $0.cancel() }
    }

    func testLoadingState() {
        // Given
        locationProviderMock.stubPermissionGranted = false
        locationProviderMock.stubCurrentLocation = nil

        // When
        setupViewModel()

        // Then
        XCTAssertEqual(subjectUnderTest.state, .loading)
        XCTAssertFalse(repositoryMock.didCallCurrentWeather)
    }

    func testErrorState() {
        // Given
        locationProviderMock.stubPermissionGranted = true
        locationProviderMock.stubCurrentLocation = .mock
        repositoryMock.stubWeather = nil

        // When
        setupViewModel()

        // Then
        XCTAssertEqual(subjectUnderTest.state, .error)
        XCTAssertTrue(repositoryMock.didCallCurrentWeather)

        // When
        subjectUnderTest.retryWeatherTapped()

        // Then
        XCTAssertEqual(subjectUnderTest.state, .error)
        XCTAssertTrue(repositoryMock.didCallCurrentWeather)
    }

    func testDataState() {
        // Given
        let expectedWeather = WeatherBuilder().build()
        locationProviderMock.stubPermissionGranted = true
        locationProviderMock.stubCurrentLocation = .mock
        repositoryMock.stubWeather = expectedWeather

        // When
        setupViewModel()

        // Then
        XCTAssertEqual(subjectUnderTest.state, .data(.init(weather: expectedWeather)))
        XCTAssertTrue(repositoryMock.didCallCurrentWeather)
    }

    func testshouldShowPermissionAlert() {
        // Given
        locationProviderMock.stubPermissionGranted = false

        // When
        setupViewModel()

        // Then
        XCTAssert(subjectUnderTest.shouldShowPermissionAlert)
    }

    func testshouldShowWeatherSearch() {
        // When
        subjectUnderTest.searchTapped()

        // Then
        XCTAssert(subjectUnderTest.shouldShowWeatherSearch)
    }

    func testShouldGoToSettings() {
        // Given
        var publisherCalled = false
        subjectUnderTest.settingsPublisher
            .sink { _ in
                publisherCalled = true
            }
            .store(in: &cancellables)

        // When
        subjectUnderTest.goToSettingsTapped()

        // Then
        XCTAssertTrue(publisherCalled)
    }
}

//MARK: Private methods

extension CurrentWeatherViewModelTests {
    private func setupViewModel() {
        subjectUnderTest = .init(
            repository: repositoryMock,
            locationProvider: locationProviderMock,
            translations: .default
        )
    }
}
