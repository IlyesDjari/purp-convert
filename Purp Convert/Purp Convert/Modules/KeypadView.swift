import SwiftUI

struct CustomNumpadView: View {
    @Environment(\.djariTheme) var theme
    
    let onDigit: (String) -> Void
    let onDecimal: () -> Void
    let onClear: () -> Void
    let onOperation: (String) -> Void
    let onEquals: () -> Void
    
    var body: some View {
        VStack(spacing: DjariKit.Spacing.numpadGap) {
            HStack(spacing: DjariKit.Spacing.numpadGap) {
                NumpadDigitButton(digit: "7", action: { onDigit("7") })
                NumpadDigitButton(digit: "8", action: { onDigit("8") })
                NumpadDigitButton(digit: "9", action: { onDigit("9") })
                NumpadClearButton(action: onClear)
            }
            
            HStack(spacing: DjariKit.Spacing.numpadGap) {
                NumpadDigitButton(digit: "4", action: { onDigit("4") })
                NumpadDigitButton(digit: "5", action: { onDigit("5") })
                NumpadDigitButton(digit: "6", action: { onDigit("6") })
                NumpadOperationButton(symbol: "+", action: { onOperation("+") })
            }
            
            HStack(spacing: DjariKit.Spacing.numpadGap) {
                NumpadDigitButton(digit: "1", action: { onDigit("1") })
                NumpadDigitButton(digit: "2", action: { onDigit("2") })
                NumpadDigitButton(digit: "3", action: { onDigit("3") })
                NumpadOperationButton(symbol: "−", action: { onOperation("-") })
            }
            
            HStack(spacing: DjariKit.Spacing.numpadGap) {
                NumpadDigitButton(digit: "0", action: { onDigit("0") })
                    .frame(maxWidth: .infinity)
                
                HStack(spacing: DjariKit.Spacing.numpadGap) {
                    NumpadDigitButton(digit: ".", action: onDecimal)
                    NumpadOperationButton(symbol: "=", action: onEquals)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(DjariKit.Spacing.lg)
        .background(theme.background)
        .cornerRadius(DjariKit.Radius.lg)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        DjariKit.Colors.Light.background.ignoresSafeArea()
        
        VStack {
            CustomNumpadView(
                onDigit: { _ in },
                onDecimal: {},
                onClear: {},
                onOperation: { _ in },
                onEquals: {}
            )
            
            Spacer()
        }
    }
    .djariTheme(false)
}
