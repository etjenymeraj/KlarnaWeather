import Foundation

public struct CurrentWeatherEndpointArgs {
    let latitude: Double
    let longitude: Double
    let unitTemperature: UnitTemperature

    public init(
        latitude: Double,
        longitude: Double,
        unitTemperature: UnitTemperature
    ) {
        self.latitude = latitude
        self.longitude = longitude
        self.unitTemperature = unitTemperature
    }
}
