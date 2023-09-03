import SwiftUI
import DesignComponents

struct DismissButtonView: View {
    let componentsFactory: ComponentsFactory
    let title: String
    let action: () -> Void

    var body: some View {
        componentsFactory
            .button
            .makeText(
                config: TextButtonConfig(
                    text: title,
                    action: action,
                    type: .default,
                    size: .small,
                    variant: .tertiary
                )
            )
    }
}
