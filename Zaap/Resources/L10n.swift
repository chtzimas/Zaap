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
  /// Please enter a valid email
  internal static let signInEmailPrompt = L10n.tr("Localizable", "sign_in_email_prompt")
  /// Please enter a valid password
  internal static let signInPasswordPrompt = L10n.tr("Localizable", "sign_in_password_prompt")
  /// Sign Up
  internal static let signUp = L10n.tr("Localizable", "sign_up")
  /// Please enter a valid email
  internal static let signUpEmailPrompt = L10n.tr("Localizable", "sign_up_email_prompt")
  /// Minimum 8 charactes with at least 1 lowercase letter, 1 uppercase, 1 digit and 1 special character
  internal static let signUpPasswordPrompt = L10n.tr("Localizable", "sign_up_password_prompt")
  /// Username
  internal static let usernamePlaceholder = L10n.tr("Localizable", "username_placeholder")
  /// Username must have at least 1 character
  internal static let usernamePrompt = L10n.tr("Localizable", "username_prompt")
  /// Verified password
  internal static let verifiedPasswordPlaceholder = L10n.tr("Localizable", "verified_password_placeholder")
  /// Passwords don't match
  internal static let verifiedPasswordPrompt = L10n.tr("Localizable", "verified_password_prompt")
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
