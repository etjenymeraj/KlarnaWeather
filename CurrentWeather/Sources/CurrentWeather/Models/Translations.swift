struct Translations {
    let minTemp: String
    let maxTemp: String
    let humidity: String
    let wind: String
    let sunrise: String
    let sunset: String
    let buttonTitle: String
    let errorTitle: String
    let errorDescription: String
    let toastTitle: String
    let toastButtonTitle: String
}

extension Translations {
    static var `default`: Self {
        .init(
            minTemp: "Min Temp",
            maxTemp: "Max Temp",
            humidity: "Humidity",
            wind: "Wind",
            sunrise: "Sunrise",
            sunset: "Sunset",
            buttonTitle: "Search Weather",
            errorTitle: "Weather Issue",
            errorDescription: "Could not fetch weather, please try again by pressing the button below",
            toastTitle: "Location permission is needed to display weather data.",
            toastButtonTitle: "Settings"
        )
    }
}


