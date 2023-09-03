import SwiftUI

public struct CircleViewBuilderConfig {
    public let size: CGFloat
    public let backgroundColor: Color
    public let foregroundColor: Color?
    public let shadow: (color: Color, radius: Double)

    public init(
        size: CGFloat,
        backgroundColor: Color,
        foregroundColor: Color? = nil,
        shadow: (color: Color, radius: Double)
    ) {
        self.size = size
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.shadow = shadow
    }
}
