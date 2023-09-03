import SwiftUI

struct ToastView: View {
    let image: Image
    let title: String
    let buttonText: String
    let buttonAction: (() -> Void)?

    var body: some View {
        HStack(spacing: 12) {
            IconView(
                image: image,
                width: 32,
                height: 32,
                color: Color.yellow
            )

            Text(title)
                .font(.body)
                .foregroundColor(Colors.secondaryForegroundColor)

            Spacer()

            if let buttonAction {
                TextButtonView(
                    text: buttonText,
                    action: buttonAction,
                    style: .init(size: SmallTextButtonSize(), colorsProvider: DefaultSecondaryColorsProvider())
                )
            }
        }
        .padding(16)
        .background(Colors.secondaryBackgroundColor)
        .cornerRadius(8)
        .shadow(
            color: Color.black.opacity(0.1),
            radius: 10,
            x: 0,
            y: 3
        )
        .shadow(
            color: Color.black.opacity(0.05),
            radius: 3,
            x: 0,
            y: 3
        )
    }
}
