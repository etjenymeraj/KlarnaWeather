@testable import WeatherSearch
import WeatherSearchMocks
import XCTest
import Combine

final class WeatherSearchViewModelTests: XCTestCase {
    private var subjectUnderTest: WeatherSearchViewModelImp!
    private var repositoryMock: WeatherSearchRepositoryMock!
    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        repositoryMock = WeatherSearchRepositoryMock()
        setupViewModel()
    }

    override func tearDown() {
        subjectUnderTest = nil
        repositoryMock = nil
        cancellables.forEach { $0.cancel() }
    }

    func testIdleState() {
        // Then
        XCTAssertFalse(repositoryMock.didCallFetchLocations)
        XCTAssertEqual(subjectUnderTest.state, .idle)
    }

    func testShouldNotFetchLocationsEmptyString() {
        // Given
        let exp = expectation(description: "Fetching locations after search debounce")

        // When
        subjectUnderTest.searchText = "   "

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            exp.fulfill()
        }

        waitForExpectations(timeout: 1)

        // Then
        XCTAssertFalse(repositoryMock.didCallFetchLocations)
    }

    func testErrorState() {
        // Given
        let exp = expectation(description: "Fetching locations after search debounce")
        repositoryMock.stubWeatherLocatons = nil

        // When
        subjectUnderTest.searchText = "anyString"

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            exp.fulfill()
        }

        waitForExpectations(timeout: 1)

        // Then
        XCTAssert(repositoryMock.didCallFetchLocations)
        XCTAssertEqual(subjectUnderTest.state, .error)
    }

    func testEmptyState() {
        // Given
        let exp = expectation(description: "Fetching locations after search debounce")
        repositoryMock.stubWeatherLocatons = []

        // When
        subjectUnderTest.searchText = "anyString"

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            exp.fulfill()
        }

        waitForExpectations(timeout: 1)

        // Then
        XCTAssert(repositoryMock.didCallFetchLocations)
        XCTAssertEqual(subjectUnderTest.state, .empty)
    }

    func testDataState() {
        // Given
        let exp = expectation(description: "Fetching locations after search debounce")
        let expectedLocation = WeatherLocationBuilder().build()
        repositoryMock.stubWeatherLocatons = [expectedLocation]

        // When
        subjectUnderTest.searchText = "anyString"

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            exp.fulfill()
        }

        waitForExpectations(timeout: 1)

        // Then
        XCTAssert(repositoryMock.didCallFetchLocations)
        XCTAssertEqual(subjectUnderTest.state, .data([expectedLocation]))
    }

    func testShouldDismiss() {
        // Given
        var publisherCalled = false
        subjectUnderTest.dismissPublisher
            .sink { _ in
                publisherCalled = true
            }
            .store(in: &cancellables)

        // When
        subjectUnderTest.dismissTapped()

        // Then
        XCTAssertTrue(publisherCalled)
    }

    func testShouldDismissFromDelegate() {
        // Given
        var publisherCalled = false
        subjectUnderTest.dismissPublisher
            .sink { _ in
                publisherCalled = true
            }
            .store(in: &cancellables)

        // When
        subjectUnderTest.locationTapped(WeatherLocationBuilder().build())

        // Then
        XCTAssertTrue(publisherCalled)
    }
}

//MARK: Private methods

extension WeatherSearchViewModelTests {
    private func setupViewModel() {
        subjectUnderTest = .init(
            repository: repositoryMock,
            translations: .default
        )
    }
}
