struct Weather {
    let location: WeatherLocation
    let condition: WeatherCondition?
    let temperature: WeatherTemperature
    let wind: WeatherWind
    let data: WeatherData
}

struct WeatherLocation: Equatable {
    let name: String
}

struct WeatherCondition: Equatable {
    let title: String
    let description: String
}

struct WeatherTemperature: Equatable {
    let actual: Double
    let min: Double
    let max: Double
    let humidity: Double
}

struct WeatherWind: Equatable {
    let speed: Double
}

struct WeatherData: Equatable {
    let sunrise: Double
    let sunset: Double
}

extension Weather: Equatable {}
