import NetworkService

public extension CurrentWeatherResponse {
    static var mock: Self {
        .init(
            name: "",
            conditions: [],
            temperature: .init(actual: 0, min: 0, max: 0, humidity: 0),
            wind: .init(speed: 0),
            system: .init(sunrise: 0, sunset: 0)
        )
    }
}

public extension GeocodingResponse {
    static var mock: Self {
        .init(
            name: "",
            latitude: 0,
            longitude: 0,
            country: "",
            state: nil
        )
    }
}
