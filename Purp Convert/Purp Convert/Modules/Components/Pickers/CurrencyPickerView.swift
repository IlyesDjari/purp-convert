import SwiftUI

struct CurrencyPickerView: View {
    @Binding var selected: CurrencyRate
    let currencies: [CurrencyRate]
    @Binding var isPresented: Bool
    let onSelect: () -> Void
    @State private var searchText = ""
    
    var filteredCurrencies: [CurrencyRate] {
        if searchText.isEmpty { return currencies }
        return currencies.filter {
            $0.code.localizedCaseInsensitiveContains(searchText) ||
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Select Currency")
                    .font(DjariKit.Typography.title2(size: 24))
                    .foregroundStyle(DjariKit.Colors.text)
                
                Spacer()
                
                Button(action: { isPresented = false }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(DjariKit.Colors.textTertiary)
                }
            }
            .padding(DjariKit.Spacing.lg)
            
            HStack(spacing: DjariKit.Spacing.md) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(DjariKit.Colors.textTertiary)
                
                TextField("Search currencies", text: $searchText)
                    .font(DjariKit.Typography.body())
                
                if !searchText.isEmpty {
                    Button(action: { searchText = "" }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 16))
                            .foregroundStyle(DjariKit.Colors.textTertiary)
                    }
                }
            }
            .padding(DjariKit.Spacing.md)
            .background(DjariKit.Colors.surfaceSecondary)
            .cornerRadius(DjariKit.Radius.md)
            .padding(.horizontal, DjariKit.Spacing.lg)
            .padding(.bottom, DjariKit.Spacing.lg)
            
            Divider()
                .overlay(DjariKit.Colors.border)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(filteredCurrencies) { currency in
                        CurrencyPickerRow(
                            currency: currency,
                            isSelected: selected.id == currency.id,
                            action: {
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                selected = currency
                                onSelect()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    isPresented = false
                                }
                            }
                        )
                    }
                }
            }
        }
        .background(DjariKit.Colors.white)
    }
}

private struct CurrencyPickerRow: View {
    let currency: CurrencyRate
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: DjariKit.Spacing.md) {
                Text(currency.symbol)
                    .font(DjariKit.Typography.number(size: 24))
                    .foregroundStyle(DjariKit.Colors.purple)
                    .frame(width: 48, height: 48)
                    .background(DjariKit.Colors.purple.opacity(0.08))
                    .cornerRadius(DjariKit.Radius.md)
                
                VStack(alignment: .leading, spacing: DjariKit.Spacing.xs) {
                    Text(currency.code)
                        .font(DjariKit.Typography.bodyEmphasis(size: 16))
                        .foregroundStyle(DjariKit.Colors.text)
                    
                    Text(currency.name)
                        .font(DjariKit.Typography.caption(size: 13))
                        .foregroundStyle(DjariKit.Colors.textSecondary)
                }
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(DjariKit.Colors.purple)
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(DjariKit.Spacing.lg)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .background(isSelected ? DjariKit.Colors.purple.opacity(0.05) : Color.clear)
    }
}
