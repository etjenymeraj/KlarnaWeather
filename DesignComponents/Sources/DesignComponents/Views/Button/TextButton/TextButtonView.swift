import SwiftUI

struct TextButtonView: View {
    var text: String
    var maxWidth: CGFloat?
    var action: () -> Void
    var style: TextButtonStyle

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(Fonts.subheadline)
                .frame(maxWidth: maxWidth)
        }
        .buttonStyle(style)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 8)
    }
}
