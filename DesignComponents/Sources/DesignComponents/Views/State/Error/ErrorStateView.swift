import SwiftUI

struct ErrorStateView: View {
    let image: Image?
    let title: String
    let description: String
    let buttonAction: (() -> Void)?

    var body: some View {
        VStack(spacing: 32) {
            if let image {
                IconView(
                    image: image,
                    width: 160,
                    height: 160
                )
            }

            VStack(spacing: 16) {
                VStack(spacing: 4) {
                    Text(title)
                        .font(.headline)

                    Text(description)
                        .font(.subheadline)
                }
                .foregroundColor(Colors.primaryForegroundColor)
                .multilineTextAlignment(.center)

                if let buttonAction {
                    TextButtonView(
                        text: "Retry",
                        action: buttonAction,
                        style: .init(size: MediumTextButtonSize(), colorsProvider: DefaultSecondaryColorsProvider())
                    )
                }
            }
        }
    }
}
