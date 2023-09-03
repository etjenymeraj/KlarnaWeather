import SwiftUI

struct TextButtonStyle: ButtonStyle {
    let size: TextButtonSize
    let colorsProvider: ButtonColorProvider

    func makeBody(configuration: Configuration) -> some View {
        CustomTextButton(
            configuration: configuration,
            size: size,
            colorsProvider: colorsProvider
        )
    }

    private struct CustomTextButton: View {
        @Environment(\.isEnabled) var isEnabled: Bool

        let configuration: Configuration
        let size: TextButtonSize
        let colorsProvider: ButtonColorProvider

        private var buttonColors: ButtonColors {
            switch (isEnabled, configuration.isPressed) {
            case (true, false): return colorsProvider.makeForDefault()
            case (false, _): return colorsProvider.makeForDisabled()
            case (true, true): return colorsProvider.makeForActive()
            }
        }

        var body: some View {
            configuration.label
                .padding(.horizontal, size.horizontalPadding)
                .padding(.vertical, size.verticalPadding)
                .frame(minWidth: size.minWidth)
                .foregroundColor(buttonColors.foregroundColor)
                .background(buttonColors.backgroundColor)
                .cornerRadius(size.cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: size.cornerRadius)
                        .stroke(
                            buttonColors.borderColor,
                            lineWidth: 1
                        )
                )
        }
    }
}
