@testable import CurrentWeather
import CurrentWeatherMocks
import XCTest

final class WeatherViewModelTests: XCTestCase {
    private var weatherBuilder: WeatherBuilder!
    
    override func setUp() {
        weatherBuilder = WeatherBuilder()
    }

    override func tearDown() {
        weatherBuilder = nil
    }

    func testLocation() {
        // Given
        let expectedName = "name"
        let location = WeatherLocationBuilder()
            .name(expectedName)
            .build()
        let weather = weatherBuilder
            .location(location)
            .build()

        // When
        let sut = makeViewModel(weather: weather)

        // Then
        XCTAssertEqual(expectedName, sut.name)
    }

    func testCondition() {
        // Given
        let expectedTitle = "title"
        let expectedDescription = "description"
        let condition = WeatherConditionBuilder()
            .title(expectedTitle)
            .description(expectedDescription)
            .build()
        let weather = weatherBuilder
            .condition(condition)
            .build()

        // When
        let sut = makeViewModel(weather: weather)

        // Then
        XCTAssertEqual(expectedTitle, sut.conditionTitle)
        XCTAssertEqual(expectedDescription, sut.conditionDescription)
        XCTAssert(sut.shouldShowCondition)
    }

    func testTemperature() {
        // Given
        let expectedActual = 32.0
        let expectedMin = 26.0
        let expectedMax = 34.0
        let expectedHumidity = 90.0
        let temperature = WeatherTemperatureBuilder()
            .actual(expectedActual)
            .min(expectedMin)
            .max(expectedMax)
            .humidity(expectedHumidity)
            .build()
        let weather = weatherBuilder
            .temperature(temperature)
            .build()

        // When
        let sut = makeViewModel(weather: weather)

        // Then
        XCTAssertEqual("\(Int(expectedActual))°", sut.actualTemp)
        XCTAssertEqual("\(Int(expectedMin))°", sut.minTemp)
        XCTAssertEqual("\(Int(expectedMax))°", sut.maxTemp)
        XCTAssertEqual("\(Int(expectedHumidity))%", sut.humidity)
    }

    func testWind() {
        // Given
        let expectedSpeed = 10.0
        let wind = WeatherWindBuilder()
            .speed(expectedSpeed)
            .build()
        let weather = weatherBuilder
            .wind(wind)
            .build()

        // When
        let sut = makeViewModel(weather: weather)

        // Then
        XCTAssertEqual("\(Int(expectedSpeed)) km/h", sut.windSpeed)
    }

    func testData() {
        // Given
        let expectedSunrise = 1661834187.0
        let expectedSunset = 1661882248.0
        let data = WeatherDataBuilder()
            .sunrise(expectedSunrise)
            .sunset(expectedSunset)
            .build()
        let weather = weatherBuilder
            .data(data)
            .build()

        // When
        let sut = makeViewModel(weather: weather)

        // Then
        XCTAssertEqual(
            Date(timeIntervalSince1970: expectedSunrise)
                .formatted(date: .omitted, time: .shortened), sut.sunrise)
        XCTAssertEqual(
            Date(timeIntervalSince1970: expectedSunset)
                .formatted(date: .omitted, time: .shortened), sut.sunset)
    }
}

// MARK: Private methods

extension WeatherViewModelTests {
    private func makeViewModel(
        weather: Weather
    ) -> WeatherViewModelImp {
        let locale = Locale(identifier: "de")
        return WeatherViewModelImp(
            weather: weatherBuilder.build(),
            locale: locale
        )
    }
}
