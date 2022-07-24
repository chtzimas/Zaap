// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// cancel
  internal static let cancel = L10n.tr("Localizable", "cancel")
  /// Don't have an account?
  internal static let donTHaveAnAccount = L10n.tr("Localizable", "don't_have_an_account")
  /// Email
  internal static let emailPlaceholder = L10n.tr("Localizable", "email_placeholder")
  /// Forgot password?
  internal static let forgotPassword = L10n.tr("Localizable", "forgot_password")
  /// or
  internal static let or = L10n.tr("Localizable", "or")
  /// Password
  internal static let passwordPlaceholder = L10n.tr("Localizable", "password_placeholder")
  /// Sign In
  internal static let signIn = L10n.tr("Localizable", "sign_in")
  /// Sign Up
  internal static let signUp = L10n.tr("Localizable", "sign_up")
  /// Username
  internal static let usernamePlaceholder = L10n.tr("Localizable", "username_placeholder")
  /// Verify password
  internal static let verifyPasswordPlaceholder = L10n.tr("Localizable", "verify_password_placeholder")
  /// Welcome to Zaap!
  internal static let welcomeHeader = L10n.tr("Localizable", "welcome_header")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
