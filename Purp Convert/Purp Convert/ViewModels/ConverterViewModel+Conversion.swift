import Foundation

extension ConverterViewModel {
    func performConversion() {
        guard let inputValue = Double(currentInput), inputValue > 0 else {
            if activeInputField == .from {
                toDisplayAmount = "0"
            } else {
                fromDisplayAmount = "0"
            }
            return
        }
        
        let isConvertingFromTo = activeInputField == .from
        let fromRate = selectedFromCurrency.rate
        let toRate = selectedToCurrency.rate
        
        conversionQueue.async { [weak self] in
            guard let self = self else { return }
            
            let convertedValue: Double
            
            if isConvertingFromTo {
                let rate = toRate / fromRate
                convertedValue = inputValue * rate
                DispatchQueue.main.async {
                    self.toDisplayAmount = self.formatForDisplay(convertedValue)
                }
            } else {
                let rate = fromRate / toRate
                convertedValue = inputValue * rate
                DispatchQueue.main.async {
                    self.fromDisplayAmount = self.formatForDisplay(convertedValue)
                }
            }
        }
    }
    
    func formatForDisplay(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", value)
        }
        let formatted = String(format: "%.2f", value)
        let trimmed = formatted.replacingOccurrences(of: "0+$", with: "", options: .regularExpression)
        return trimmed.replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)
    }
}
