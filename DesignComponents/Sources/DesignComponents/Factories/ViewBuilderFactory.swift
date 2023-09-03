import SwiftUI

public struct ViewBuilderFactory {
    public init() {}

    public func makeCircle<Content: View>(
        config: CircleViewBuilderConfig,
        content: @escaping () -> Content
    ) -> some View {
        CircleViewBuilder(
            size: config.size,
            backgroundColor: config.backgroundColor,
            foregroundColor: config.foregroundColor,
            shadow: config.shadow,
            content: content
        )
    }
}
