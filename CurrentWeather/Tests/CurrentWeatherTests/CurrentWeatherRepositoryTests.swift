import XCTest
import NetworkServiceMocks
import UtilitiesMocks
import Combine
@testable import CurrentWeather

final class CurrentWeatherRepositoryTests: XCTestCase {
    private var subjectUnderTest: CurrentWeatherRepositoryImp!
    private var apiRequestsMock: APIRequestsMock!
    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        apiRequestsMock = APIRequestsMock()
        subjectUnderTest = CurrentWeatherRepositoryImp(requests: apiRequestsMock)
    }

    override func tearDown() {
        subjectUnderTest = nil
        apiRequestsMock = nil
        cancellables.forEach { $0.cancel() }
    }

    func testCurrentWeatherResponseSuccess() {
        // Given
        var success: Bool = false
        apiRequestsMock.stubCurrentWeatherResponse = .mock

        // When
        subjectUnderTest
            .fetchCurrentWeather(location: .mock)
            .sink { completion in
                guard case .failure = completion else { return }
                
                success = false
            } receiveValue: { _ in
                success = true
            }
            .store(in: &cancellables)

        // Then
        XCTAssert(apiRequestsMock.didCallCurrentWeather)
        XCTAssert(success)
    }

    func testCurrentWeatherResponseFailure() {
        // Given
        var success: Bool = false
        apiRequestsMock.stubCurrentWeatherResponse = nil

        // When
        subjectUnderTest
            .fetchCurrentWeather(location: .mock)
            .sink { completion in
                guard case .failure = completion else { return }
                
                success = false
            } receiveValue: { _ in
                success = true
            }
            .store(in: &cancellables)

        // Then
        XCTAssert(apiRequestsMock.didCallCurrentWeather)
        XCTAssertFalse(success)
    }
}
