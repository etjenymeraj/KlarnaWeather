import SwiftUI
import DesignComponents

struct WeatherSearchErrorView: View {
    let componentsFactory: ComponentsFactory
    let translations: Translations

    var body: some View {
        componentsFactory
            .state
            .makeError(
                config: ErrorStateConfig(
                    image: Image(systemName: "wifi.slash"),
                    title: translations.errorTitle,
                    description: translations.errorDescription
                )
            )
    }
}
