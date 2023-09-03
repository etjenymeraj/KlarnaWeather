public struct WeatherLocation {
    public let name: String
    public let latitude: Double
    public let longitude: Double
    public let country: String
    public let state: String?
}

extension WeatherLocation: Identifiable {
    public var id: String {
        "\(String(latitude))\(String(longitude))"
    }
}

extension WeatherLocation: Equatable {}
