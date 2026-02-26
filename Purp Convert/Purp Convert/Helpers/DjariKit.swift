import SwiftUI

struct DjariKit {
    // MARK: - Theme Management
    struct Theme {
        let isDark: Bool
        
        var background: Color {
            isDark ? Color(red: 0.08, green: 0.08, blue: 0.1) : Color.white
        }
        
        var text: Color {
            isDark ? Color.white : Color(red: 0.15, green: 0.15, blue: 0.2)
        }
        
        var textSecondary: Color {
            isDark ? Color(red: 0.7, green: 0.7, blue: 0.75) : Color(red: 0.5, green: 0.5, blue: 0.55)
        }
        
        var textTertiary: Color {
            isDark ? Color(red: 0.5, green: 0.5, blue: 0.55) : Color(red: 0.7, green: 0.7, blue: 0.75)
        }
        
        var numpadButtonBg: Color {
            isDark ? Color(red: 0.15, green: 0.15, blue: 0.17) : Color(red: 0.96, green: 0.96, blue: 0.97)
        }
        
        var clearButtonBg: Color {
            isDark ? Color(red: 0.12, green: 0.12, blue: 0.14) : Color(red: 0.93, green: 0.85, blue: 0.98).opacity(0.5)
        }
        
        var divider: Color {
            isDark ? Color(red: 0.2, green: 0.2, blue: 0.22) : Color(red: 0.95, green: 0.95, blue: 0.97)
        }
    }
    
    struct Colors {
        // Brand Colors
        static let purple = Color(red: 0.65, green: 0.15, blue: 0.95)
        static let purpleLight = Color(red: 0.75, green: 0.4, blue: 0.98)
        static let purpleDark = Color(red: 0.55, green: 0.05, blue: 0.85)
        
        // Light Mode
        struct Light {
            static let background = Color.white
            static let text = Color(red: 0.15, green: 0.15, blue: 0.2)
            static let textSecondary = Color(red: 0.5, green: 0.5, blue: 0.55)
            static let textTertiary = Color(red: 0.7, green: 0.7, blue: 0.75)
            static let divider = Color(red: 0.95, green: 0.95, blue: 0.97)
            static let numpadButton = Color(red: 0.96, green: 0.96, blue: 0.97)
            static let clearButton = Color(red: 0.93, green: 0.85, blue: 0.98).opacity(0.5)
        }
        
        // Dark Mode
        struct Dark {
            static let background = Color(red: 0.08, green: 0.08, blue: 0.1)
            static let text = Color.white
            static let textSecondary = Color(red: 0.7, green: 0.7, blue: 0.75)
            static let textTertiary = Color(red: 0.5, green: 0.5, blue: 0.55)
            static let divider = Color(red: 0.2, green: 0.2, blue: 0.22)
            static let numpadButton = Color(red: 0.15, green: 0.15, blue: 0.17)
            static let clearButton = Color(red: 0.12, green: 0.12, blue: 0.14)
        }
        
        // Legacy - for compatibility
        static let white = Color.white
        static let bg = Color(red: 0.98, green: 0.98, blue: 1.0)
        static let surface = Color.white
        static let surfaceSecondary = Color(red: 0.97, green: 0.97, blue: 0.99)
        static let text = Color(red: 0.15, green: 0.15, blue: 0.2)
        static let textSecondary = Color(red: 0.5, green: 0.5, blue: 0.55)
        static let textTertiary = Color(red: 0.7, green: 0.7, blue: 0.75)
        static let border = Color(red: 0.92, green: 0.92, blue: 0.95)
        static let divider = Color(red: 0.95, green: 0.95, blue: 0.97)
        static let success = Color(red: 0.35, green: 0.78, blue: 0.52)
        static let error = Color(red: 0.88, green: 0.28, blue: 0.32)
        static let warning = Color(red: 0.95, green: 0.65, blue: 0.15)
    }
    
    struct Typography {
        // Display Typography
        static func displayLarge(size: CGFloat = 64) -> Font {
            .system(size: size, weight: .bold, design: .default)
        }
        
        static func title1(size: CGFloat = 32) -> Font {
            .system(size: size, weight: .bold, design: .rounded)
        }
        
        static func title2(size: CGFloat = 24) -> Font {
            .system(size: size, weight: .bold, design: .rounded)
        }
        
        static func headline(size: CGFloat = 20) -> Font {
            .system(size: size, weight: .semibold, design: .rounded)
        }
        
        static func body(size: CGFloat = 16) -> Font {
            .system(size: size, weight: .regular, design: .default)
        }
        
        static func bodyEmphasis(size: CGFloat = 16) -> Font {
            .system(size: size, weight: .semibold, design: .default)
        }
        
        static func caption(size: CGFloat = 13) -> Font {
            .system(size: size, weight: .medium, design: .default)
        }
        
        static func microCopy(size: CGFloat = 12) -> Font {
            .system(size: size, weight: .regular, design: .default)
        }
        
        static func number(size: CGFloat = 48) -> Font {
            .system(size: size, weight: .black, design: .rounded)
        }
        
        static func numpadButton(size: CGFloat = 22) -> Font {
            .system(size: size, weight: .semibold, design: .default)
        }
    }
    
    struct Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
        static let xl: CGFloat = 32
        static let xxl: CGFloat = 48
        
        // Numpad specific
        static let numpadGap: CGFloat = 12
    }
    
    struct Radius {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20
        static let pill: CGFloat = 100
        
        // Button specific
        static let buttonSmall: CGFloat = 14
        static let buttonLarge: CGFloat = 18
    }
}

// MARK: - Environment Key for Theme
struct ThemeKey: EnvironmentKey {
    static let defaultValue = DjariKit.Theme(isDark: false)
}

extension EnvironmentValues {
    var djariTheme: DjariKit.Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

// MARK: - View Extensions for Themed Styling

extension View {
    func djariTheme(_ isDark: Bool) -> some View {
        environment(\.djariTheme, DjariKit.Theme(isDark: isDark))
    }
    
    // Numpad Button Styling - Circular
    func djariNumpadButton(theme: DjariKit.Theme) -> some View {
        self
            .font(DjariKit.Typography.numpadButton(size: 22))
            .foregroundStyle(theme.text)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(theme.numpadButtonBg)
            .cornerRadius(30)
    }
    
    // Action Button Styling - Purple Column
    func djariActionButton() -> some View {
        self
            .font(DjariKit.Typography.numpadButton(size: 22))
            .foregroundStyle(.white)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(DjariKit.Colors.purple)
            .cornerRadius(30)
    }
    
    // Clear Button Styling
    func djariClearButton(theme: DjariKit.Theme) -> some View {
        self
            .font(DjariKit.Typography.numpadButton(size: 20))
            .foregroundStyle(theme.text)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(theme.clearButtonBg)
            .cornerRadius(30)
    }
    
    // Legacy
    func djariSurface() -> some View {
        background(DjariKit.Colors.surface)
            .cornerRadius(DjariKit.Radius.lg)
            .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
    }
    
    func djariSurfaceSecondary() -> some View {
        background(DjariKit.Colors.surfaceSecondary)
            .cornerRadius(DjariKit.Radius.md)
    }
    
    func djariButton() -> some View {
        font(DjariKit.Typography.bodyEmphasis(size: 16))
            .foregroundStyle(DjariKit.Colors.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, DjariKit.Spacing.md)
            .background(DjariKit.Colors.purple)
            .cornerRadius(DjariKit.Radius.md)
    }
    
    func djariSecondaryButton() -> some View {
        font(DjariKit.Typography.bodyEmphasis(size: 16))
            .foregroundStyle(DjariKit.Colors.purple)
            .frame(maxWidth: .infinity)
            .padding(.vertical, DjariKit.Spacing.md)
            .background(DjariKit.Colors.purple.opacity(0.08))
            .cornerRadius(DjariKit.Radius.md)
    }
    
    func djariIconButton() -> some View {
        font(.system(size: 16, weight: .semibold))
            .frame(width: 44, height: 44)
            .background(DjariKit.Colors.purple)
            .foregroundStyle(DjariKit.Colors.white)
            .cornerRadius(DjariKit.Radius.md)
    }
}

struct DjariAnimations {
    static let snappy = Animation.spring(response: 0.3, dampingFraction: 0.72, blendDuration: 0)
    static let smooth = Animation.spring(response: 0.5, dampingFraction: 0.82, blendDuration: 0)
    static let bounce = Animation.spring(response: 0.6, dampingFraction: 0.65, blendDuration: 0)
}
