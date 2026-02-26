import SwiftUI

struct NumpadOperationButton: View {
    let symbol: String
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: handleTap) {
            Text(symbol)
                .djariActionButton()
        }
        .scaleEffect(buttonScale)
    }
    
    private func handleTap() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
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
    NumpadOperationButton(symbol: "+", action: {})
        .padding()
}
