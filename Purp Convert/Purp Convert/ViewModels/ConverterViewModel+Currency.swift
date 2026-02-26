import Foundation

extension ConverterViewModel {
    func swapCurrencies() {
        let temp = selectedFromCurrency
        selectedFromCurrency = selectedToCurrency
        selectedToCurrency = temp
        
        let tempDisplay = fromDisplayAmount
        fromDisplayAmount = toDisplayAmount
        toDisplayAmount = tempDisplay
        
        updateExchangeRateDisplay()
        performConversion()
    }
    
    func updateExchangeRateDisplay() {
        let rate = selectedToCurrency.rate / selectedFromCurrency.rate
        exchangeRate = String(format: "%.2f", rate)
    }
    
    func fetchExchangeRates() {
        isLoading = true
        errorMessage = nil
        
        conversionQueue.async { [weak self] in
            guard let self = self else { return }
            
            Thread.sleep(forTimeInterval: 0.5)
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.lastUpdated = Date()
                self.updateExchangeRateDisplay()
                self.performConversion()
            }
        }
    }
}
