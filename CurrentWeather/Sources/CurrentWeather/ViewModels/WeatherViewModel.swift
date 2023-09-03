import Foundation

protocol WeatherViewModel: Equatable {
    var name: String { get }
    var conditionTitle: String { get }
    var conditionDescription: String { get }
    var shouldShowCondition: Bool { get }
    var actualTemp: String { get }
    var minTemp: String { get }
    var maxTemp: String { get }
    var humidity: String { get }
    var windSpeed: String { get }
    var sunrise: String { get }
    var sunset: String { get }
}

struct WeatherViewModelImp {
    private let weather: Weather
    private let locale: Locale

    init(
        weather: Weather,
        locale: Locale = .current
    ) {
        self.weather = weather
        self.locale = locale
    }
}

// MARK: Private methods

extension WeatherViewModelImp {
    private func makeTemp(value: Double) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .short
        let temperature = Measurement(value: value.rounded(), unit: UnitTemperature(forLocale: locale))
        return formatter.string(from: temperature)
    }

    private func makeSpeed(value: Double) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        let speed = Measurement(value: weather.wind.speed, unit: UnitSpeed(forLocale: locale))
        return formatter.string(from: speed)
    }
}

// MARK: WeatherViewModel

extension WeatherViewModelImp: WeatherViewModel {
    var name: String {
        weather.location.name
    }

    var conditionTitle: String {
        weather.condition?.title ?? ""
    }

    var conditionDescription: String {
        weather.condition?.description ?? ""
    }

    var shouldShowCondition: Bool {
        weather.condition != nil
    }

    var actualTemp: String {
        makeTemp(value: weather.temperature.actual)
    }

    var minTemp: String {
        makeTemp(value: weather.temperature.min)
    }

    var maxTemp: String {
        makeTemp(value: weather.temperature.max)
    }

    var humidity: String {
        String(format: "%.0f%%", weather.temperature.humidity.rounded())
    }

    var windSpeed: String {
        makeSpeed(value: weather.wind.speed)
    }

    var sunrise: String {
        Date(timeIntervalSince1970: weather.data.sunrise)
            .formatted(date: .omitted, time: .shortened)
    }

    var sunset: String {
        Date(timeIntervalSince1970: weather.data.sunset)
            .formatted(date: .omitted, time: .shortened)
    }
}
