import XCTest
import NetworkServiceMocks
import Combine
@testable import WeatherSearch

final class WeatherSearchRepositoryTests: XCTestCase {
    private var subjectUnderTest: WeatherSearchRepositoryImp!
    private var apiRequestsMock: APIRequestsMock!
    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        apiRequestsMock = APIRequestsMock()
        subjectUnderTest = WeatherSearchRepositoryImp(requests: apiRequestsMock)
    }

    override func tearDown() {
        subjectUnderTest = nil
        apiRequestsMock = nil
        cancellables.forEach { $0.cancel() }
    }

    func testWeatherSearchResponseSuccess() {
        // Given
        var success: Bool = false
        apiRequestsMock.stubGeocodingResponse = [.mock]

        // When
        subjectUnderTest
            .fetchLocations(query: "anyString")
            .sink { completion in
                guard case .failure = completion else { return }
                
                success = false
            } receiveValue: { _ in
                success = true
            }
            .store(in: &cancellables)

        // Then
        XCTAssert(apiRequestsMock.didCallGeocoding)
        XCTAssert(success)
    }

    func testWeatherSearchResponseFailure() {
        // Given
        var success: Bool = false
        apiRequestsMock.stubGeocodingResponse = nil

        // When
        subjectUnderTest
            .fetchLocations(query: "anyString")
            .sink { completion in
                guard case .failure = completion else { return }
                
                success = false
            } receiveValue: { _ in
                success = true
            }
            .store(in: &cancellables)

        // Then
        XCTAssert(apiRequestsMock.didCallGeocoding)
        XCTAssertFalse(success)
    }
}
