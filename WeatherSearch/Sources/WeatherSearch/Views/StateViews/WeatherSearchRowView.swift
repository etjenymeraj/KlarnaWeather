import SwiftUI
import DesignComponents

struct WeatherSearchRowView: View {
    let componentsFactory: ComponentsFactory
    let name: String
    let country: String
    let state: String?

    var body: some View {
        HStack(spacing: 8) {
            componentsFactory
                .image
                .makeIcon(
                    config: IconConfig(
                        image: Image(systemName: "location.fill"),
                        width: 18,
                        height: 18,
                        color: Colors.secondaryForegroundColor
                    ))
            Text(name + " " + country)
                .font(Fonts.body)
                .foregroundColor(Colors.secondaryForegroundColor)
            Spacer()
        }
        .contentShape(Rectangle())
    }
}
