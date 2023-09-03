import SwiftUI
import DesignComponents

struct WeatherItemView: View {
    let componentsFactory: ComponentsFactory
    let title: String
    let description: String
    let iconName: String

    var body: some View {
        HStack(spacing: 16) {
            componentsFactory.viewBuilder.makeCircle(
                config: CircleViewBuilderConfig(
                    size: 50,
                    backgroundColor: Colors.imageBackgroundColor,
                    shadow: (color: .black.opacity(0.2), radius: 4)
                )) {
                componentsFactory
                    .image
                    .makeIcon(config: IconConfig(
                        image: Image(systemName: iconName),
                        width: 24,
                        height: 24
                    ))
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(Fonts.caption)
                Text(description)
                    .bold()
                    .font(Fonts.headline)
            }
            .foregroundColor(Colors.secondaryForegroundColor)
        }
    }
}
