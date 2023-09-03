import XCTest
import NetworkServiceMocks
import Combine
@testable import NetworkService

final class ApiRequestsTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()

    func testCurrentWeatherRequest() {
        // Given
        let args = CurrentWeatherEndpointArgs(latitude: 0, longitude: 0, unitTemperature: .celsius)
        let apiClientMock = APIClientMock()
        apiClientMock.stubResponse = CurrentWeatherResponse.mock
        let subjectUnderTest = APIRequestsImp(apiClient: apiClientMock)

        // When
        subjectUnderTest
            .currentWeather(args: args)
            .sink { completion in
                guard case .failure = completion else { return }

                XCTFail()
            } receiveValue: { _ in }
            .store(in: &cancellables)

        // Then
        XCTAssert(apiClientMock.didCallRequest)
    }

    func testGeocodingRequest() {
        // Given
        let args = GeocodingEndpointArgs(name: "")
        let apiClientMock = APIClientMock()
        apiClientMock.stubResponse = [GeocodingResponse.mock]
        let subjectUnderTest = APIRequestsImp(apiClient: apiClientMock)

        // When
        subjectUnderTest
            .geocoding(args: args)
            .sink { completion in
                guard case .failure = completion else { return }

                XCTFail()
            } receiveValue: { _ in }
            .store(in: &cancellables)


        // Then
        XCTAssert(apiClientMock.didCallRequest)
    }
}
