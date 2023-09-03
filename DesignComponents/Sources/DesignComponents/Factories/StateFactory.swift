import SwiftUI

public struct StateFactory {
    public init() {}

    public func makeError(config: ErrorStateConfig) -> some View {
        ErrorStateView(
            image: config.image,
            title: config.title,
            description: config.description,
            buttonAction: config.buttonAction
        )
    }
}
