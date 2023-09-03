public protocol WeatherSearchModuleDelegate: AnyObject {
    func didSelectLocation(_ location: WeatherLocation)
}
