import Foundation

extension ConverterViewModel {
    func appendDigit(_ digit: String) {
        if currentInput == "0" && digit != "." {
            currentInput = digit
        } else if currentInput == "0" && digit == "." {
            currentInput = "0."
            hasDecimal = true
        } else {
            currentInput.append(digit)
        }
        updateDisplayText()
        performConversion()
    }
    
    func appendDecimal() {
        if !hasDecimal {
            if currentInput.isEmpty {
                currentInput = "0."
            } else {
                currentInput.append(".")
            }
            hasDecimal = true
        }
        updateDisplayText()
        performConversion()
    }
    
    func clearInput() {
        currentInput = "0"
        hasDecimal = false
        pendingOperation = nil
        previousValue = 0
        updateDisplayText()
        performConversion()
    }
}
