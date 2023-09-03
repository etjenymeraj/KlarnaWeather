import SwiftUI
import CurrentWeather

@main
struct KlarnaWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            CurrentWeatherViewModuleFactoryImp().make()
        }
    }
}
