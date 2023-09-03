public struct CurrentWeatherResponse: Decodable {
    public let name: String
    public let conditions: [CurrentWeatherConditionResponse]
    public let temperature: CurrentWeatherTemperatureResponse
    public let wind: CurrentWeatherWindResponse
    public let system: CurrentWeatherSystemResponse

    public init(
        name: String,
        conditions: [CurrentWeatherConditionResponse],
        temperature: CurrentWeatherTemperatureResponse,
        wind: CurrentWeatherWindResponse,
        system: CurrentWeatherSystemResponse
    ) {
        self.name = name
        self.conditions = conditions
        self.temperature = temperature
        self.wind = wind
        self.system = system
    }

    enum CodingKeys: String, CodingKey {
        case name
        case conditions = "weather"
        case temperature = "main"
        case wind
        case system = "sys"
    }
}

extension CurrentWeatherResponse {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(forKey: .name)
        conditions = try container.decode(forKey: .conditions)
        temperature = try container.decode(forKey: .temperature)
        wind = try container.decode(forKey: .wind)
        system = try container.decode(forKey: .system)
    }
}

public struct CurrentWeatherConditionResponse: Decodable {
    public let title: String
    public let description: String

    public init(
        title: String,
        description: String
    ) {
        self.title = title
        self.description = description
    }

    enum CodingKeys: String, CodingKey {
        case title = "main"
        case description
    }
}

extension CurrentWeatherConditionResponse {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(forKey: .title)
        description = try container.decode(forKey: .description)
    }
}

public struct CurrentWeatherTemperatureResponse: Decodable {
    public let actual: Double
    public let min: Double
    public let max: Double
    public let humidity: Double

    public init(
        actual: Double,
        min: Double,
        max: Double,
        humidity: Double
    ) {
        self.actual = actual
        self.min = min
        self.max = max
        self.humidity = humidity
    }

    enum CodingKeys: String, CodingKey {
        case actual = "temp"
        case min = "temp_min"
        case max = "temp_max"
        case humidity
    }
}

extension CurrentWeatherTemperatureResponse {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        actual = try container.decode(forKey: .actual)
        min = try container.decode(forKey: .min)
        max = try container.decode(forKey: .max)
        humidity = try container.decode(forKey: .humidity)
    }
}

public struct CurrentWeatherWindResponse: Decodable {
    public let speed: Double

    public init(
        speed: Double
    ) {
        self.speed = speed
    }
}

public struct CurrentWeatherSystemResponse: Decodable {
    public let sunrise: Double
    public let sunset: Double

    public init(
        sunrise: Double,
        sunset: Double
    ) {
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

