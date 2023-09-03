import SwiftUI
import DesignComponents

struct WeatherStatsView<ViewModel: WeatherViewModel>: View {
    let componentsFactory: ComponentsFactory
    let weather: ViewModel
    let translations: Translations
    let action: () -> Void

    var body: some View {
        VStack(spacing: 32) {
            HStack {
                VStack(alignment: .leading, spacing: 32) {
                    WeatherItemView(
                        componentsFactory: componentsFactory,
                        title: translations.minTemp,
                        description: weather.minTemp,
                        iconName: "thermometer.low"
                    )
                    WeatherItemView(
                        componentsFactory: componentsFactory,
                        title: translations.humidity,
                        description: weather.humidity,
                        iconName: "humidity"
                    )
                    WeatherItemView(
                        componentsFactory: componentsFactory,
                        title: translations.sunrise,
                        description: weather.sunrise,
                        iconName: "sunrise"
                    )
                }
                Spacer()
                VStack(alignment: .leading, spacing: 32) {
                    WeatherItemView(
                        componentsFactory: componentsFactory,
                        title: translations.maxTemp,
                        description: weather.maxTemp,
                        iconName: "thermometer.high"
                    )
                    WeatherItemView(
                        componentsFactory: componentsFactory,
                        title: translations.wind,
                        description: weather.windSpeed,
                        iconName: "wind")
                    WeatherItemView(
                        componentsFactory: componentsFactory,
                        title: translations.sunset,
                        description: weather.sunset,
                        iconName: "sunset")
                }
            }
            SearchWeatherButtonView(
                componentsFactory: componentsFactory,
                title: translations.buttonTitle,
                action: action
            )
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .top, .trailing], 16)
        .padding(.bottom, 32)
        .background(Colors.secondaryBackgroundColor)
        .cornerRadius(12)
    }
}
