@testable import CurrentWeather

public final class WeatherBuilder {
    private var location: WeatherLocation = WeatherLocationBuilder().build()
    private var condition: WeatherCondition? = WeatherConditionBuilder().build()
    private var temperature: WeatherTemperature = WeatherTemperatureBuilder().build()
    private var wind: WeatherWind = WeatherWindBuilder().build()
    private var data: WeatherData = WeatherDataBuilder().build()

    public init() {}

    public func location(_ location: WeatherLocation) -> WeatherBuilder {
        self.location = location
        return self
    }

    public func condition(_ condition: WeatherCondition?) -> WeatherBuilder {
        self.condition = condition
        return self
    }

    public func temperature(_ temperature: WeatherTemperature) -> WeatherBuilder {
        self.temperature = temperature
        return self
    }

    public func wind(_ wind: WeatherWind) -> WeatherBuilder {
        self.wind = wind
        return self
    }

    public func data(_ data: WeatherData) -> WeatherBuilder {
        self.data = data
        return self
    }

    public func build() -> Weather {
        .init(
            location: location,
            condition: condition,
            temperature: temperature,
            wind: wind,
            data: data
        )
    }
}

public final class WeatherLocationBuilder {
    private var name: String = ""

    public init() {}

    public func name(_ name: String) -> WeatherLocationBuilder {
        self.name = name
        return self
    }

    public func build() -> WeatherLocation {
        .init(name: name)
    }
}

public final class WeatherConditionBuilder {
    private var title: String = ""
    private var description: String = ""

    public init() {}

    public func title(_ title: String) -> WeatherConditionBuilder {
        self.title = title
        return self
    }

    public func description(_ description: String) -> WeatherConditionBuilder {
        self.description = description
        return self
    }

    public func build() -> WeatherCondition {
        .init(title: title, description: description)
    }
}

public final class WeatherTemperatureBuilder {
    private var actual: Double = 0
    private var min: Double = 0
    private var max: Double = 0
    private var humidity: Double = 0

    public init() {}

    public func actual(_ actual: Double) -> WeatherTemperatureBuilder {
        self.actual = actual
        return self
    }

    public func min(_ min: Double) -> WeatherTemperatureBuilder {
        self.min = min
        return self
    }

    public func max(_ max: Double) -> WeatherTemperatureBuilder {
        self.max = max
        return self
    }

    public func humidity(_ humidity: Double) -> WeatherTemperatureBuilder {
        self.humidity = humidity
        return self
    }

    public func build() -> WeatherTemperature {
        .init(
            actual: actual,
            min: min,
            max: max,
            humidity: humidity
        )
    }
}

public final class WeatherWindBuilder {
    private var speed: Double = 0

    public init() {}

    public func speed(_ speed: Double) -> WeatherWindBuilder {
        self.speed = speed
        return self
    }
    
    public func build() -> WeatherWind {
        .init(
            speed: speed
        )
    }
}

public final class WeatherDataBuilder {
    private var sunrise: Double = 0
    private var sunset: Double = 0

    public init() {}

    public func sunrise(_ sunrise: Double) -> WeatherDataBuilder {
        self.sunrise = sunrise
        return self
    }

    public func sunset(_ sunset: Double) -> WeatherDataBuilder {
        self.sunset = sunset
        return self
    }
    
    public func build() -> WeatherData {
        .init(
            sunrise: sunrise,
            sunset: sunset
        )
    }
}

