import SwiftUI

public struct ButtonColors {
    let foregroundColor: Color
    let backgroundColor: Color
    let borderColor: Color
}

public protocol ButtonColorProvider {
    func makeForDefault() -> ButtonColors
    func makeForDisabled() -> ButtonColors
    func makeForActive() -> ButtonColors
}

// MARK: - Default

public struct DefaultPrimaryColorsProvider: ButtonColorProvider {
    public func makeForDefault() -> ButtonColors {
        ButtonColors(
            foregroundColor: Colors.primaryForegroundColor,
            backgroundColor: Colors.primaryBackgroundColor.opacity(0.8),
            borderColor: .clear
        )
    }

    public func makeForActive() -> ButtonColors {
        ButtonColors(
            foregroundColor: Colors.primaryForegroundColor,
            backgroundColor: Colors.primaryBackgroundColor,
            borderColor: .clear
        )
    }

    public func makeForDisabled() -> ButtonColors {
        ButtonColors(
            foregroundColor: Color.white,
            backgroundColor: Color.gray,
            borderColor: .clear
        )
    }
}

public struct DefaultSecondaryColorsProvider: ButtonColorProvider {
    public func makeForDefault() -> ButtonColors {
        ButtonColors(
            foregroundColor: Colors.secondaryForegroundColor,
            backgroundColor: Colors.secondaryBackgroundColor.opacity(0.8),
            borderColor: .white
        )
    }

    public func makeForActive() -> ButtonColors {
        ButtonColors(
            foregroundColor: Colors.secondaryForegroundColor,
            backgroundColor: Colors.secondaryBackgroundColor,
            borderColor: .white
        )
    }

    public func makeForDisabled() -> ButtonColors {
        ButtonColors(
            foregroundColor: Color.white,
            backgroundColor: Color.gray,
            borderColor: .clear
        )
    }
}

public struct DefaultTertiaryColorsProvider: ButtonColorProvider {
    public func makeForDefault() -> ButtonColors {
        ButtonColors(
            foregroundColor: Colors.primaryForegroundColor,
            backgroundColor: .clear,
            borderColor: .clear
        )
    }

    public func makeForActive() -> ButtonColors {
        ButtonColors(
            foregroundColor: Colors.primaryForegroundColor,
            backgroundColor: .clear,
            borderColor: .clear
        )
    }

    public func makeForDisabled() -> ButtonColors {
        ButtonColors(
            foregroundColor: Color.gray,
            backgroundColor: .clear,
            borderColor: .clear
        )
    }
}
