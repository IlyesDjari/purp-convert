import Foundation

extension ConverterViewModel {
    static func defaultUSD() -> CurrencyRate {
        CurrencyRate(
            id: "USD",
            code: "USD",
            name: "US Dollar",
            symbol: "$",
            rate: 1.0
        )
    }
    
    static func defaultAUD() -> CurrencyRate {
        CurrencyRate(
            id: "AUD",
            code: "AUD",
            name: "Australian Dollar",
            symbol: "A$",
            rate: 1.53
        )
    }
    
    static func mockCurrencies() -> [CurrencyRate] {
        [
            CurrencyRate(id: "USD", code: "USD", name: "US Dollar", symbol: "$", rate: 1.0),
            CurrencyRate(id: "EUR", code: "EUR", name: "Euro", symbol: "€", rate: 0.92),
            CurrencyRate(id: "GBP", code: "GBP", name: "British Pound", symbol: "£", rate: 0.79),
            CurrencyRate(id: "JPY", code: "JPY", name: "Japanese Yen", symbol: "¥", rate: 150.0),
            CurrencyRate(id: "AUD", code: "AUD", name: "Australian Dollar", symbol: "A$", rate: 1.53),
            CurrencyRate(id: "CAD", code: "CAD", name: "Canadian Dollar", symbol: "C$", rate: 1.36),
            CurrencyRate(id: "CHF", code: "CHF", name: "Swiss Franc", symbol: "Fr", rate: 0.88),
            CurrencyRate(id: "CNY", code: "CNY", name: "Chinese Yuan", symbol: "¥", rate: 7.24),
            CurrencyRate(id: "INR", code: "INR", name: "Indian Rupee", symbol: "₹", rate: 83.0),
            CurrencyRate(id: "MXN", code: "MXN", name: "Mexican Peso", symbol: "$", rate: 17.05),
        ]
    }
}
