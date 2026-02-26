import SwiftUI

// MARK: - Currency Selector Header Pill
struct CurrencySelectorHeaderView: View {
    @Environment(\.djariTheme) var theme
    
    let fromCurrency: CurrencyRate
    let toCurrency: CurrencyRate
    let onSwap: () -> Void
    let onFromTap: () -> Void
    let onToTap: () -> Void
    
    var body: some View {
        VStack {
            HStack(spacing: DjariKit.Spacing.lg) {
                // From Currency
                VStack(spacing: DjariKit.Spacing.xs) {
                    Text(fromCurrency.code)
                        .font(DjariKit.Typography.headline(size: 18))
                        .foregroundStyle(theme.text)
                    
                    Text(fromCurrency.name)
                        .font(DjariKit.Typography.caption(size: 11))
                        .foregroundStyle(theme.textSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .contentShape(Rectangle())
                .onTapGesture(perform: onFromTap)
                
                // Swap Button
                Button(action: onSwap) {
                    Image(systemName: "arrow.left.arrow.right")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(DjariKit.Colors.purple)
                        .frame(width: 40, height: 40)
                        .background(theme.numpadButtonBg)
                        .cornerRadius(20)
                }
                
                // To Currency
                VStack(spacing: DjariKit.Spacing.xs) {
                    Text(toCurrency.code)
                        .font(DjariKit.Typography.headline(size: 18))
                        .foregroundStyle(theme.text)
                    
                    Text(toCurrency.name)
                        .font(DjariKit.Typography.caption(size: 11))
                        .foregroundStyle(theme.textSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .contentShape(Rectangle())
                .onTapGesture(perform: onToTap)
            }
            .padding(.horizontal, DjariKit.Spacing.lg)
            .padding(.vertical, DjariKit.Spacing.md)
        }
        .background(theme.numpadButtonBg)
        .cornerRadius(DjariKit.Radius.pill)
        .padding(.horizontal, DjariKit.Spacing.lg)
    }
}

// MARK: - Selectable Display Area with Field Selection
struct SelectableDisplayAreaView: View {
    @Environment(\.djariTheme) var theme
    
    let fromAmount: String
    let fromCurrency: CurrencyRate
    let toAmount: String
    let toCurrency: CurrencyRate
    let exchangeRate: String
    let selectedField: InputField
    let onFromTap: () -> Void
    let onToTap: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // FROM FIELD - Primary input
            VStack(alignment: .leading, spacing: DjariKit.Spacing.md) {
                HStack(alignment: .top, spacing: DjariKit.Spacing.lg) {
                    VStack(alignment: .leading, spacing: DjariKit.Spacing.xs) {
                        Text(fromAmount)
                            .font(DjariKit.Typography.displayLarge(size: 48))
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            .foregroundStyle(theme.text)
                            .contentTransition(.numericText())
                        
                        Text("\(fromCurrency.symbol)\(fromCurrency.code)")
                            .font(DjariKit.Typography.caption(size: 12))
                            .foregroundStyle(theme.textSecondary)
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal, DjariKit.Spacing.lg)
            .padding(.vertical, DjariKit.Spacing.lg)
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .background(
                selectedField == .from
                    ? DjariKit.Colors.purple.opacity(0.1)
                    : Color.clear
            )
            .cornerRadius(DjariKit.Radius.md)
            .onTapGesture(perform: onFromTap)
            
            Divider()
                .overlay(theme.divider)
                .padding(.horizontal, DjariKit.Spacing.lg)
                .padding(.vertical, DjariKit.Spacing.md)
            
            // TO FIELD - Secondary input
            VStack(alignment: .leading, spacing: DjariKit.Spacing.md) {
                HStack(alignment: .top, spacing: DjariKit.Spacing.lg) {
                    VStack(alignment: .leading, spacing: DjariKit.Spacing.xs) {
                        Text( toAmount)
                            .font(DjariKit.Typography.displayLarge(size: 48))
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            .foregroundStyle(theme.text)
                            .contentTransition(.numericText())
                        
                        Text("\(toCurrency.symbol)\(toCurrency.code)")
                            .font(DjariKit.Typography.caption(size: 12))
                            .foregroundStyle(theme.textSecondary)
                    }
                    
                    Spacer()
                }
                
                Text("1 \(fromCurrency.code) = \(exchangeRate) \(toCurrency.code)")
                    .font(DjariKit.Typography.microCopy(size: 11))
                    .foregroundStyle(theme.textTertiary)
            }
            .padding(.horizontal, DjariKit.Spacing.lg)
            .padding(.vertical, DjariKit.Spacing.lg)
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .background(
                selectedField == .to
                    ? DjariKit.Colors.purple.opacity(0.1)
                    : Color.clear
            )
            .cornerRadius(DjariKit.Radius.md)
            .onTapGesture(perform: onToTap)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        Color.white.ignoresSafeArea()
        
        VStack(spacing: 20) {
            SelectableDisplayAreaView(
                fromAmount: "1000",
                fromCurrency: ConverterViewModel.defaultUSD(),
                toAmount: "1530",
                toCurrency: ConverterViewModel.defaultAUD(),
                exchangeRate: "1.53",
                selectedField: .from,
                onFromTap: {},
                onToTap: {}
            )
            
            Spacer()
        }
        .padding()
    }
    .djariTheme(false)
}

// MARK: - Display Area (Legacy)
struct DisplayAreaView: View {
    @Environment(\.djariTheme) var theme
    
    let fromAmount: String
    let fromCurrency: CurrencyRate
    let toAmount: String
    let toCurrency: CurrencyRate
    let exchangeRate: String
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: DjariKit.Spacing.md) {
                HStack(alignment: .lastTextBaseline, spacing: DjariKit.Spacing.lg) {
                    VStack(alignment: .leading, spacing: DjariKit.Spacing.xs) {
                        Text(fromAmount)
                            .font(DjariKit.Typography.displayLarge(size: 56))
                            .foregroundStyle(theme.text)
                            .contentTransition(.numericText())
                        
                        Text("\(fromCurrency.symbol)\(fromCurrency.code)")
                            .font(DjariKit.Typography.caption(size: 12))
                            .foregroundStyle(theme.textSecondary)
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal, DjariKit.Spacing.lg)
            .padding(.vertical, DjariKit.Spacing.lg)
            
            Divider()
                .overlay(theme.divider)
                .padding(.horizontal, DjariKit.Spacing.lg)
            
            VStack(alignment: .leading, spacing: DjariKit.Spacing.md) {
                HStack(alignment: .lastTextBaseline, spacing: DjariKit.Spacing.lg) {
                    VStack(alignment: .leading, spacing: DjariKit.Spacing.xs) {
                        Text(toAmount)
                            .font(DjariKit.Typography.displayLarge(size: 56))
                            .foregroundStyle(theme.text)
                            .contentTransition(.numericText())
                        
                        Text("\(toCurrency.symbol)\(toCurrency.code)")
                            .font(DjariKit.Typography.caption(size: 12))
                            .foregroundStyle(theme.textSecondary)
                    }
                    
                    Spacer()
                }
                
                Text("1 \(fromCurrency.code) = \(exchangeRate) \(toCurrency.code)")
                    .font(DjariKit.Typography.microCopy(size: 11))
                    .foregroundStyle(theme.textTertiary)
            }
            .padding(.horizontal, DjariKit.Spacing.lg)
            .padding(.vertical, DjariKit.Spacing.lg)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        Color.white.ignoresSafeArea()
        
        VStack(spacing: 20) {
            CurrencySelectorHeaderView(
                fromCurrency: ConverterViewModel.defaultUSD(),
                toCurrency: ConverterViewModel.defaultAUD(),
                onSwap: {},
                onFromTap: {},
                onToTap: {}
            )
            
            DisplayAreaView(
                fromAmount: "1000.00",
                fromCurrency: ConverterViewModel.defaultUSD(),
                toAmount: "1530.00",
                toCurrency: ConverterViewModel.defaultAUD(),
                exchangeRate: "1.53"
            )
            
            Spacer()
        }
        .padding(.top, 20)
    }
}
