import SwiftUI
import DesignComponents

struct WeatherLocationView<ViewModel: WeatherViewModel>: View {
    let weather: ViewModel

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 0) {
                Text(weather.name)
                    .bold()
                    .font(Fonts.title)
                if weather.shouldShowCondition {
                    Text(weather.conditionDescription)
                        .font(Fonts.subheadline)
                }
            }
            .foregroundColor(Colors.primaryForegroundColor)

            Spacer()
        }
    }
}
