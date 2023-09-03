import XCTest
import WeatherSearchMocks
@testable import CurrentWeather

final class CurrentWeatherRouterTests: XCTestCase {
    private var subjectUnderTest: CurrentWeatherRouterImp<
        WeatherSearchViewModuleFactoryMock
    >!
    private var weatherSearchFactoryMock: WeatherSearchViewModuleFactoryMock!

    override func setUp() {
        weatherSearchFactoryMock = WeatherSearchViewModuleFactoryMock()
        subjectUnderTest = CurrentWeatherRouterImp(weatherSearchFactory: weatherSearchFactoryMock)
    }

    override func tearDown() {
        subjectUnderTest = nil
        weatherSearchFactoryMock = nil
    }

    func testMakeWeatherSearch() {
        // When
        _ = subjectUnderTest.makeWeatherSearch()

        // Then
        XCTAssert(weatherSearchFactoryMock.didCallMake)
    }
}
