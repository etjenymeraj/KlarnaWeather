import SwiftUI

public struct TextButtonConfig {
    public let text: String
    public let maxWidth: CGFloat?
    public let action: () -> Void
    public let type: ButtonType
    public let size: ButtonSize
    public let variant: ButtonVariant

    public init(
        text: String,
        maxWidth: CGFloat? = nil,
        action: @escaping () -> Void,
        type: ButtonType,
        size: ButtonSize,
        variant: ButtonVariant
    ) {
        self.text = text
        self.maxWidth = maxWidth
        self.action = action
        self.type = type
        self.size = size
        self.variant = variant
    }
}
