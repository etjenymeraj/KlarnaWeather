import SwiftUI
import DesignComponents

struct WeatherTemperatureView<ViewModel: WeatherViewModel>: View {
    let components: ComponentsFactory
    let weather: ViewModel

    var body: some View {
        HStack {
            VStack(spacing: 8) {
                if weather.shouldShowCondition {
                    components
                        .image.makeIcon(
                            config: IconConfig(
                                image: Image(systemName: "aqi.medium"),
                                width: 20,
                                height: 20
                            )
                        )
                    Text(weather.conditionTitle)
                        .font(Fonts.body)
                        .fontWeight(.light)
                }
            }

            Spacer()

            Text(weather.actualTemp)
                .bold()
                .font(Fonts.customLarge)
        }
        .foregroundColor(Colors.primaryForegroundColor)
    }
}
