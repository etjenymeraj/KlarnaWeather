import SwiftUI
import DesignComponents

struct WeatherErrorView: View {
    let componentsFactory: ComponentsFactory
    let translations: Translations
    let action: () -> Void

    var body: some View {
        componentsFactory
            .state
            .makeError(
                config: ErrorStateConfig(
                    image: Image(systemName: "wifi.slash"),
                    title: translations.errorTitle,
                    description: translations.errorDescription,
                    buttonAction: action
                )
            )
    }
}
