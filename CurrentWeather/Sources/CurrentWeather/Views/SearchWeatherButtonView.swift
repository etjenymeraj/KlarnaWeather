import SwiftUI
import DesignComponents

struct SearchWeatherButtonView: View {
    let componentsFactory: ComponentsFactory
    let title: String
    let action: () -> Void

    var body: some View {
        componentsFactory
            .button
            .makeText(
                config: TextButtonConfig(
                    text: title,
                    maxWidth: .infinity,
                    action: action,
                    type: .default,
                    size: .large,
                    variant: .primary
                )
            )
    }
}
