import SwiftUI

struct NumpadDigitButton: View {
    @Environment(\.djariTheme) var theme
    
    let digit: String
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: handleTap) {
            Text(digit)
                .djariNumpadButton(theme: theme)
        }
        .scaleEffect(buttonScale)
    }
    
    private func handleTap() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        withAnimation(.spring(response: 0.25, dampingFraction: 0.7, blendDuration: 0)) {
            isPressed = true
        }
        action()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
            withAnimation(.spring(response: 0.25, dampingFraction: 0.7, blendDuration: 0)) {
                isPressed = false
            }
        }
    }
    
    private var buttonScale: CGFloat {
        isPressed ? 0.88 : 1.0
    }
}

#Preview {
    NumpadDigitButton(digit: "5", action: {})
        .djariTheme(false)
        .padding()
}
