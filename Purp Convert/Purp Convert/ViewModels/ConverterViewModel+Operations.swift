import Foundation

extension ConverterViewModel {
    func selectOperation(_ operation: String) {
        guard let value = Double(currentInput) else { return }
        
        if let pending = pendingOperation {
            let result = performOperation(previousValue, value, pending)
            previousValue = result
            currentInput = formatForDisplay(result)
        } else {
            previousValue = value
        }
        
        pendingOperation = operation
        updateDisplayText()
        currentInput = "0"
        hasDecimal = false
    }
    
    func calculateResult() {
        guard let operation = pendingOperation,
              let value = Double(currentInput) else {
            return
        }
        
        let result = performOperation(previousValue, value, operation)
        currentInput = formatForDisplay(result)
        updateDisplayText()
        pendingOperation = nil
        hasDecimal = true
        performConversion()
    }
    
    private func performOperation(_ a: Double, _ b: Double, _ op: String) -> Double {
        switch op {
        case "+":
            return a + b
        case "-":
            return a - b
        case "=":
            return b
        default:
            return b
        }
    }
}
