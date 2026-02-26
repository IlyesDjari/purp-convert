import Foundation
import Observation

@Observable
@MainActor
final class ConverterViewModel {
    var selectedFromCurrency: CurrencyRate
    var selectedToCurrency: CurrencyRate
    var exchangeRate: String = "1.00"
    var isLoading = false
    var errorMessage: String?
    var lastUpdated: Date?
    
    var allCurrencies: [CurrencyRate] = []
    
    var activeInputField: InputField = .from
    var fromDisplayAmount: String = "0"
    var toDisplayAmount: String = "0"
    
    var displayText: String {
        activeInputField == .from ? fromDisplayAmount : toDisplayAmount
    }
    
    nonisolated(unsafe) private let currencyCache = CurrencyCache.shared
    let conversionQueue = DispatchQueue(
        label: "com.studioDjari.converter.calculation",
        qos: .userInitiated
    )
    
    var fromInput: String = "0"
    var toInput: String = "0"
    var currentInput: String {
        get { activeInputField == .from ? fromInput : toInput }
        set {
            if activeInputField == .from {
                fromInput = newValue
            } else {
                toInput = newValue
            }
        }
    }
    
    var pendingOperation: String?
    var previousValue: Double = 0
    var hasDecimal: Bool = false
    
    init(
        fromCurrency: CurrencyRate? = nil,
        toCurrency: CurrencyRate? = nil
    ) {
        self.selectedFromCurrency = fromCurrency ?? ConverterViewModel.defaultUSD()
        self.selectedToCurrency = toCurrency ?? ConverterViewModel.defaultAUD()
        self.allCurrencies = ConverterViewModel.mockCurrencies()
        
        loadCachedRates()
        updateExchangeRateDisplay()
    }
    
    func setActiveField(_ field: InputField) {
        activeInputField = field
        updateDisplayText()
    }
    
    func updateDisplayText() {
        if activeInputField == .from {
            fromDisplayAmount = currentInput
        } else {
            toDisplayAmount = currentInput
        }
    }
    
    func clearError() {
        errorMessage = nil
    }
    
    nonisolated private func loadCachedRates() {
        // Load from UserDefaults or Core Data in production
    }
}
