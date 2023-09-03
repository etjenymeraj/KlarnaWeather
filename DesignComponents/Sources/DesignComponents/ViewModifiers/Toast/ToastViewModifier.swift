import SwiftUI

struct ToastViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    let toastView: ToastView
    let bottomPadding: CGFloat

    private var dragGestureBottom: some Gesture {
        DragGesture()
            .onEnded { value in
                if value.translation.height > 0 {
                    isPresented = false
                }
            }
    }

    func body(content: Content) -> some View {
        content.overlay(
            VStack {
                Spacer()
                if isPresented {
                    toastView
                        .padding(.horizontal, 16)
                        .padding(.bottom, bottomPadding)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .gesture(
                            dragGestureBottom
                        )
                }
            }.animation(.easeIn(duration: 0.3), value: isPresented)
        )
    }
}
