import XCTest
@testable import NetworkService

final class ApiRequestFactoryTests: XCTestCase {
    func testURLBuilderMakesRequest() throws {
        // Given
        let endpoint = CurrentWeatherEndpoint(args: .init(latitude: 12, longitude: 34, unitTemperature: .celsius))

        // When
        let urlRequest = APIRequestFactory().makeRequest(endpoint: endpoint)

        // Then
        let expectedURLString = urlRequest?.url?.absoluteString
        let unwrappedURLString = try XCTUnwrap(expectedURLString)
        XCTAssertNotNil(URL(string: unwrappedURLString))
    }
}
