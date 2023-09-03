import SwiftUI
import DesignComponents

struct WeatherSearchEmptyView: View {
    let componentsFactory: ComponentsFactory
    let translations: Translations

    var body: some View {
        componentsFactory
            .state
            .makeError(
                config: ErrorStateConfig(
                    image: Image(systemName: "basket"),
                    title: translations.emptyTitle,
                    description: translations.emptyDescription
                )
            )
    }
}
