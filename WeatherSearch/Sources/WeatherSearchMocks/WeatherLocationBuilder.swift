@testable import WeatherSearch

public final class WeatherLocationBuilder {
    private var name: String = ""
    private var latitude: Double = 0
    private var longitude: Double = 0
    private var country: String = ""
    private var state: String?

    public init() {}

    public func name(_ name: String) -> WeatherLocationBuilder {
        self.name = name
        return self
    }

    public func latitude(_ latitude: Double) -> WeatherLocationBuilder {
        self.latitude = latitude
        return self
    }

    public func longitude(_ longitude: Double) -> WeatherLocationBuilder {
        self.longitude = longitude
        return self
    }

    public func country(_ country: String) -> WeatherLocationBuilder {
        self.country = country
        return self
    }

    public func state(_ state: String?) -> WeatherLocationBuilder {
        self.state = state
        return self
    }

    public func build() -> WeatherLocation {
        .init(
            name: name,
            latitude: latitude,
            longitude: longitude,
            country: country,
            state: state
        )
    }
}
