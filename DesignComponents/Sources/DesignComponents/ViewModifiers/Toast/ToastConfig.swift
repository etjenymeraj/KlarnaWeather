import SwiftUI

public struct ToastConfig {
    public var isPresented: Binding<Bool>
    public let image: Image
    public let title: String
    public let buttonText: String
    public let buttonAction: (() -> Void)?
    public let bottomPadding: Double

    public init(
        isPresented: Binding<Bool>,
        image: Image,
        title: String,
        buttonText: String,
        buttonAction: (() -> Void)?,
        bottomPadding: Double = 60
    ) {
        self.isPresented = isPresented
        self.image = image
        self.title = title
        self.buttonText = buttonText
        self.buttonAction = buttonAction
        self.bottomPadding = bottomPadding
    }
}
