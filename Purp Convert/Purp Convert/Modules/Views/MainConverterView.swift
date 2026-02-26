import SwiftUI

struct MainConverterView: View {
    @State var viewModel = ConverterViewModel()
    @State private var showFromPicker = false
    @State private var showToPicker = false
    @State private var selectedField: InputField = .from
    @Environment(\.colorScheme) var colorScheme
    
    var isDarkMode: Bool {
        colorScheme == .dark
    }
    
    var body: some View {
        ZStack {
            (isDarkMode ? DjariKit.Colors.Dark.background : DjariKit.Colors.Light.background)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                CurrencySelectorHeaderView(
                    fromCurrency: viewModel.selectedFromCurrency,
                    toCurrency: viewModel.selectedToCurrency,
                    onSwap: { viewModel.swapCurrencies() },
                    onFromTap: { showFromPicker = true },
                    onToTap: { showToPicker = true }
                )
                .padding(.top, DjariKit.Spacing.xxl + DjariKit.Spacing.lg)
                .padding(.bottom, DjariKit.Spacing.lg)
                .padding(.horizontal, DjariKit.Spacing.md)
                .djariTheme(isDarkMode)
                
                SelectableDisplayAreaView(
                    fromAmount: viewModel.fromDisplayAmount,
                    fromCurrency: viewModel.selectedFromCurrency,
                    toAmount: viewModel.toDisplayAmount,
                    toCurrency: viewModel.selectedToCurrency,
                    exchangeRate: viewModel.exchangeRate,
                    selectedField: selectedField,
                    onFromTap: { 
                        selectedField = .from
                        viewModel.setActiveField(.from)
                    },
                    onToTap: { 
                        selectedField = .to
                        viewModel.setActiveField(.to)
                    }
                )
                .djariTheme(isDarkMode)
                .padding(.bottom, DjariKit.Spacing.lg)
                .padding(.horizontal, DjariKit.Spacing.md)
                
                Spacer()
                
                CustomNumpadView(
                    onDigit: { digit in
                        viewModel.appendDigit(digit)
                    },
                    onDecimal: {
                        viewModel.appendDigit(".")
                    },
                    onClear: {
                        viewModel.clearInput()
                    },
                    onOperation: { operation in
                        viewModel.selectOperation(operation)
                    },
                    onEquals: {
                        viewModel.calculateResult()
                    }
                )
                .djariTheme(isDarkMode)
                .padding(.horizontal, DjariKit.Spacing.md)
                .padding(.bottom, DjariKit.Spacing.lg)
            }
            .ignoresSafeArea(.keyboard)
        }
        .sheet(isPresented: $showFromPicker) {
            CurrencyPickerView(
                selected: $viewModel.selectedFromCurrency,
                currencies: viewModel.allCurrencies,
                isPresented: $showFromPicker,
                onSelect: { viewModel.updateExchangeRateDisplay() }
            )
        }
        .sheet(isPresented: $showToPicker) {
            CurrencyPickerView(
                selected: $viewModel.selectedToCurrency,
                currencies: viewModel.allCurrencies,
                isPresented: $showToPicker,
                onSelect: { viewModel.updateExchangeRateDisplay() }
            )
        }
    }
}

#Preview {
    MainConverterView()
}
