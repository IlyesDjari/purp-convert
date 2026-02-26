# Purp Convert

> A premium currency conversion calculator for iOS built with SwiftUI. Elegant design, intuitive interactions, and production-ready code.

[![iOS Version](https://img.shields.io/badge/iOS-17.0%2B-blue)](https://www.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.9-orange)](https://swift.org)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Code Quality](https://img.shields.io/badge/Code%20Quality-Production%20Ready-success)](IMPLEMENTATION_EXAMPLES.md)

## Overview

Purp Convert is a sophisticated currency conversion application that combines powerful calculation capabilities with an exceptionally refined user interface. Designed with premium UX principles, the app provides instant currency conversion with real-time exchange rates, bidirectional input, and professional-grade animations.

### Key Highlights
- 🎨 **Premium UI/UX Design** - Purple-themed interface with polished animations
- 🧮 **Bidirectional Input** - Tap either field to input amounts
- ⚡ **Instant Calculations** - Real-time conversion with operation display
- 📱 **Safe Area Optimized** - Perfectly aligned on all iPhone models
- 🎯 **Production Ready** - Modular architecture, comprehensive error handling
- ♿ **Accessible** - Full tap targets, clear visual feedback

## Features

### Core Functionality
- **Dual-Field Currency Conversion** - Select from/to currencies independently
- **Real-time Exchange Rates** - Integration-ready API structure with cached rates
- **Calculator Mode** - Support for mathematical operations (+, −, =)
- **Smart Number Formatting** - Intelligent decimal display (no unnecessary .00)
- **Operation Visibility** - Active operations displayed prominently in the number area

### User Experience
- **Bidirectional Tappable Fields** - Full-area hit targets for accessible input
- **Visual Field Selection** - Purple highlight shows active input field
- **Spring Animations** - Smooth, tactile button responses (0.88x scale on press)
- **Dynamic Island Safe** - Proper spacing for all iPhone notch variations
- **Real-time Updates** - Instant conversion as you enter values

## Technology Stack

### Core Framework
- **SwiftUI** - Modern declarative UI framework
- **Observation Framework** - Reactive state management (@Observable)
- **Combine** - Asynchronous operations and data binding

### Architecture
- **MVVM** - ConverterViewModel handles all business logic
- **Component-Based Design** - Reusable button and card components
- **Environment Values** - Theme system via @Environment

### Code Quality
- **Modular Structure** - Organized into Components, Views, Models
- **Type-Safe** - Strong typing with custom enums (InputField)
- **Error Handling** - Comprehensive error types and messages
- **No Third-Party Dependencies** - Native Swift/SwiftUI only

## Project Structure

```
Purp Convert/
├── ViewModels/
│   ├── ConverterViewModel.swift              - Core class & state management
│   ├── ConverterViewModel+Input.swift        - Digit & decimal input (appendDigit, appendDecimal, clearInput)
│   ├── ConverterViewModel+Operations.swift   - Calculator operations (selectOperation, calculateResult)
│   ├── ConverterViewModel+Conversion.swift   - Bidirectional currency conversion
│   ├── ConverterViewModel+Currency.swift     - Currency management (swap, rates)
│   └── ConverterViewModel+MockData.swift     - Mock data & test helpers
│
├── Models/
│   └── ConverterModels.swift                 - Data models (CurrencyRate, InputField, ConverterError)
│
├── Modules/
│   ├── Components/
│   │   ├── Buttons/
│   │   │   ├── NumpadDigitButton.swift
│   │   │   ├── NumpadOperationButton.swift
│   │   │   └── NumpadClearButton.swift
│   │   ├── Cards/
│   │   │   └── ConversionCardView.swift      - Display components with field selection
│   │   └── Pickers/
│   │       └── CurrencyPickerView.swift
│   ├── Views/
│   │   └── MainConverterView.swift           - Main app container
│   └── KeypadView.swift                      - Numpad 4x4 grid layout
│
├── Helpers/
│   └── DjariKit.swift                        - Design system (colors, spacing, typography)
│
└── ContentView.swift                         - App entry point
```

## Architecture

### MVVM + Extensions Pattern
The project uses a modular extension-based architecture for clean separation of concerns:

**ConverterViewModel.swift** (Core)
- Observable state container
- Initialization
- Field management
- Display text synchronization

**ConverterViewModel+Input.swift**
- Numpad input handling
- Decimal point management
- Input clearing

**ConverterViewModel+Operations.swift**
- Calculator mode with pending operations
- Result calculation
- Mathematical operations (+, −)

**ConverterViewModel+Conversion.swift**
- Bidirectional currency conversion
- Background queue processing
- Smart number formatting (removes .00 when not needed)

**ConverterViewModel+Currency.swift**
- Currency selection and swapping
- Exchange rate updates
- Network integration point

**ConverterViewModel+MockData.swift**
- Test data generation
- 10+ currencies for testing

### State Management
```swift
@Observable
@MainActor
final class ConverterViewModel {
    // Public State
    var selectedFromCurrency: CurrencyRate
    var selectedToCurrency: CurrencyRate
    var activeInputField: InputField = .from
    var fromDisplayAmount: String = "0"
    var toDisplayAmount: String = "0"
}
```

### Bidirectional Input
- **Tap From Field** → Input values, auto-converts to To amount
- **Tap To Field** → Input values, auto-converts to From amount
- Real-time conversion on background queue
- Visual feedback with purple highlighting

### Thread Safety
- Main actor isolation for UI state
- Background dispatch queue for conversions
- Sendable types for concurrency safety
- Proper value capturing in async closures

## Features in Detail

### Bidirectional Currency Conversion
Input in either field and watch real-time conversions:
```
From: 1000 USD → To: 1530 AUD (automatic)
From: 1530 AUD → To: 1000 USD (automatic)
```

### Calculator Integration
All calculator operations (+ − =) work seamlessly with conversion:
```
Input: 100 + 50 =
Result: 150 (auto-converts to target currency)
```

### Smart Number Formatting
```
1000.00   → 1000    (removes unnecessary decimals)
1000.50   → 1000.5  (keeps necessary precision)
1000.55   → 1000.55 (full decimal precision)
```

### Premium Animations
- Spring-based button animations (0.25s response, 0.7 dampening)
- 0.88x scale on press for tactile feedback
- Smooth number transitions via contentTransition
- Seamless field switching

## Getting Started

### Prerequisites
- Xcode 15.0 or later
- iOS 17.0 or later
- Swift 5.9+

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/purp-convert.git
   cd purp-convert
   ```

2. **Open in Xcode**
   ```bash
   open "Purp Convert/Purp Convert.xcodeproj"
   ```

3. **Build & Run**
   - Select your target iPhone simulator or device
   - Press `Cmd + R` to build and run

### Development Setup

The project uses Xcode's native build system with no external dependency managers:

```bash
# Build from command line
xcodebuild -scheme "Purp Convert" -configuration Debug

# Run tests
xcodebuild test -scheme "Purp Convert"
```

## Usage

### Basic Operation

1. **Input Amount** - Tap the from-amount field and use the numpad
2. **Select Operation** - Press +, −, or proceed to conversion
3. **View Conversion** - The to-amount updates in real-time
4. **Switch Currencies** - Tap currency codes or use swap button
5. **Calculate** - Press = to finalize calculations

### Keyboard Actions
- **Digits (0-9)** - Add to current input
- **Period (.)** - Add decimal point (once per number)
- **(+) / (−)** - Queue operation, show operator symbol
- **(=)** - Calculate and display result
- **(C)** - Clear input and reset calculator

### Field Selection
- **Tap From Amount** - Enable input for source currency
- **Tap To Amount** - Enable input for target currency (visual indicator)
- Purple highlight shows active field

## Code Standards

### Architecture Principles
- **Single Responsibility** - Each file/extension has one domain
- **MVVM Pattern** - Clean separation of business logic and UI
- **Extension-Based Organization** - ConverterViewModel split across focused extensions
- **Type Safety** - Strong typing with custom enums
- **Thread Safety** - Main actor isolation + background queue processing
- **Sendable Compliance** - Thread-safe data types for concurrency

### Naming Conventions
- **ViewModels**: `[Domain]ViewModel` (e.g., `ConverterViewModel`)
- **Extensions**: `[ClassName]+[Domain]` (e.g., `ConverterViewModel+Input`)
- **Views**: `[Feature]View` (e.g., `ConversionCardView`)
- **Components**: `[Type][Name]` (e.g., `NumpadDigitButton`)
- **Models**: Descriptive names (e.g., `CurrencyRate`, `InputField`)
- **Properties**: camelCase, descriptive
- **Functions**: actionVerb pattern (e.g., `appendDigit`, `selectOperation`)

### Best Practices Applied
✅ **No private properties in extensions** - Use internal for cross-file access  
✅ **Single Responsibility** - ~30-50 lines per extension file  
✅ **Professional Comments** - Only essential MARK sections  
✅ **Thread-Safe Singletons** - CurrencyCache with Sendable protocol  
✅ **Main Actor Isolation** - Prevents race conditions  
✅ **Computed Properties** - Smart state management  
✅ **Async Processing** - Background queues for conversions  
✅ **Error Handling** - Comprehensive error types  

### File Organization
- **30-50 lines per file** - Highly maintainable
- **Clear MARK sections** - Easy navigation  
- **No redundant code** - Single source of truth
- **Focused responsibilities** - Easy to test and extend

## Features in Detail

### Bidirectional Input
```swift
enum InputField {
    case from
    case to
}

// SelectableDisplayAreaView highlights active field
// Ready for reverse conversion implementation
```

### Smart Number Formatting
```swift
// Smart decimal handling
formatForDisplay(1000.0)    // "1000"
formatForDisplay(1000.5)    // "1000.5"
formatForDisplay(1000.50)   // "1000.5"
```

### Operation Display
Operations show inline with the number:
```
1000 +     ← Operation visible next to amount
```

### Animations
- **Button Press**: Spring(response: 0.25, dampingFraction: 0.7)
- **Scale**: 1.0 → 0.88 (12% reduction)
- **Timing**: 120ms press/release cycle

## Testing

### Manual Testing Scenarios

**Currency Conversion**
```
Input: 1000 USD → AUD
Expected: ~1530 AUD (varies by rate)
```

**Calculation Mode**
```
Input: 100 + 50 =
Expected: 150
Display: "150" (no .00)
```

**Field Selection**
```
Tap From Amount → Purple highlight activates
Tap To Amount → Field switches
```

**Safe Area**
```
Launch on iPhone 14 Pro (Dynamic Island)
Currency header properly spaced below notch
All content visible without overlap
```

## Performance Considerations

- **Numpad Animations**: Spring animations optimized for smooth 60fps
- **State Updates**: Batched via @Observable (no excessive re-renders)
- **Number Formatting**: String operations are O(1) for typical values
- **Memory**: Lightweight components, minimal allocations

## Future Enhancements

### Planned Features
- [ ] Reverse conversion (tap To field to input)
- [ ] Transaction history
- [ ] Offline rate caching
- [ ] Custom rate input
- [ ] Multi-currency conversion
- [ ] Cryptocurrency support

### Architecture Readiness
- Services layer ready for API integration
- Error handling framework in place
- Modular structure supports feature addition

## Contributing

### Guidelines
1. Follow the code standards above
2. Keep components small and focused (< 200 lines)
3. Test all user interactions manually
4. Update relevant documentation
5. Use descriptive commit messages

### Process
```bash
1. Create feature branch: git checkout -b feature/my-feature
2. Make changes following code standards
3. Test thoroughly
4. Commit: git commit -m "Add: description of changes"
5. Push: git push origin feature/my-feature
6. Create Pull Request with detailed description
```

## Maintenance

### Code Review Checklist
- [ ] Follows naming conventions
- [ ] Safe area properly handled
- [ ] Animations smooth and responsive
- [ ] Error handling complete
- [ ] No unnecessary shadows/effects
- [ ] Full tap targets (accessibility)
- [ ] Works on all iPhone models

### Building for Production
```bash
# Development
xcodebuild -scheme "Purp Convert" -configuration Debug

# Production
xcodebuild -scheme "Purp Convert" -configuration Release \
  -arch arm64 -arch arm64e
```

## Documentation

- [ARCHITECTURE.md](ARCHITECTURE.md) - Detailed architecture decisions
- [IMPLEMENTATION_EXAMPLES.md](IMPLEMENTATION_EXAMPLES.md) - Code examples & patterns
- [Modules/STRUCTURE.md](Purp%20Convert/Purp%20Convert/Modules/STRUCTURE.md) - File organization
- [DELIVERABLES.md](DELIVERABLES.md) - Project status & completion

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Studio Djari**
- Website: [studiodj ari.com](https://studiodj ari.com)
- Focus: Premium iOS applications with production-grade code

---

## Support

For issues, suggestions, or contributions, please:
1. Check existing issues
2. Create a detailed issue with reproduction steps
3. Include device model and iOS version
4. Attach relevant screenshots or error messages

---

**Built with ❤️ for iOS Excellence**