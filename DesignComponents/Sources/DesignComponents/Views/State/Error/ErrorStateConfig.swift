import SwiftUI

public struct ErrorStateConfig {
    public let image: Image?
    public let title: String
    public let description: String
    public let buttonAction: (() -> Void)?

    public init(
        image: Image? = nil,
        title: String,
        description: String,
        buttonAction: (() -> Void)? = nil
    ) {
        self.image = image
        self.title = title
        self.description = description
        self.buttonAction = buttonAction
    }
}
