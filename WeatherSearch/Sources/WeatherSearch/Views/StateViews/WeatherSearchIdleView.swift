import SwiftUI
import DesignComponents

struct WeatherSearchIdleView: View {
    let componentsFactory: ComponentsFactory
    let translations: Translations

    var body: some View {
        componentsFactory
            .state
            .makeError(
                config: ErrorStateConfig(
                    image: Image(systemName: "magnifyingglass"),
                    title: translations.idleTitle,
                    description: translations.idleDescription
                )
            )
    }
}
