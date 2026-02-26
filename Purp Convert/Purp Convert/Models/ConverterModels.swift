import Foundation

struct CurrencyRate: Codable, Identifiable, Sendable {
    let id: String
    let code: String
    let name: String
    let symbol: String
    let rate: Double
}

struct ConversionResult: Sendable {
    let fromAmount: Double
    let fromCurrency: CurrencyRate
    let toAmount: Double
    let toCurrency: CurrencyRate
    let timestamp: Date
}

enum InputField {
    case from
    case to
}

enum ConverterError: LocalizedError {
    case invalidInput
    case conversionFailed
    case networkError
    case decodingError
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "Please enter a valid amount."
        case .conversionFailed:
            return "Conversion failed. Please try again."
        case .networkError:
            return "Network error. Using cached rates."
        case .decodingError:
            return "Error processing exchange rates."
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}

final class CurrencyCache: Sendable {
    static let shared = CurrencyCache()
    private init() {}
}
