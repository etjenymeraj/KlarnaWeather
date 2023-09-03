import SwiftUI

public struct ImageFactory {
    public init() {}

    public func makeIcon(config: IconConfig) -> some View {
        IconView(
            image: config.image,
            width: config.width,
            height: config.height,
            color: config.color
        )
    }
}
