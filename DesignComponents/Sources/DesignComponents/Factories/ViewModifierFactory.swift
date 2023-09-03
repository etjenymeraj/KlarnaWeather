import SwiftUI

public struct ViewModifierFactory {
    public init() {}

    public func makeToast(config: ToastConfig) -> some ViewModifier {
        ToastViewModifier(
            isPresented: config.isPresented,
            toastView: ToastView(
                image: config.image,
                title: config.title,
                buttonText: config.buttonText,
                buttonAction: config.buttonAction
            ),
            bottomPadding: config.bottomPadding
        )
    }
}
