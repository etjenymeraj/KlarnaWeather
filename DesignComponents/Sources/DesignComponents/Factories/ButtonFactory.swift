import SwiftUI

public struct ButtonFactory {
    public init() {}

    public func makeText(config: TextButtonConfig) -> some View {
        TextButtonView(
            text: config.text,
            maxWidth: config.maxWidth,
            action: config.action,
            style: TextButtonStyle(
                size: makeButtonSize(config.size),
                colorsProvider: makeColors(config.variant, config.type)
            )
        )
    }
}

// MARK: - Private

extension ButtonFactory {
    private func makeColors(
        _ variant: ButtonVariant,
        _ type: ButtonType
    ) -> ButtonColorProvider {
        let colorsProvider: ButtonColorProvider
        switch (type, variant) {
        case (.default, .primary):
            colorsProvider = DefaultPrimaryColorsProvider()
        case (.default, .secondary):
            colorsProvider = DefaultSecondaryColorsProvider()
        case (.default, .tertiary):
            colorsProvider = DefaultTertiaryColorsProvider()
        }
        return colorsProvider
    }

    private func makeButtonSize(
        _ size: ButtonSize
    ) -> TextButtonSize {
        let buttonSize: TextButtonSize
        switch size {
        case .small: buttonSize = SmallTextButtonSize()
        case .medium: buttonSize = MediumTextButtonSize()
        case .large: buttonSize = LargeTextButtonSize()
        }
        return buttonSize
    }
}

