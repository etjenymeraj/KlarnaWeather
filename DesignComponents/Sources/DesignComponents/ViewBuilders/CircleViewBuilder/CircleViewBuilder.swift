import SwiftUI

struct CircleViewBuilder<Content: View>: View {
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color?
    var shadow: (color: Color, radius: Double)
    @ViewBuilder var content: () -> Content
  
    var body: some View {
        Circle()
            .fill(backgroundColor)
            .shadow(color: shadow.color, radius: shadow.radius, x: 0.0, y: 4.0)
            .overlay(content()
                .foregroundColor(foregroundColor)
            )
            .frame(width: size, height: size)
  }
}
