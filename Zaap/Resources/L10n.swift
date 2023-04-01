// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// cancel
  internal static let cancel = L10n.tr("Localizable", "cancel", fallback: "cancel")
  /// Don't have an account?
  internal static let donTHaveAnAccount = L10n.tr("Localizable", "don't_have_an_account", fallback: "Don't have an account?")
  /// Email
  internal static let emailPlaceholder = L10n.tr("Localizable", "email_placeholder", fallback: "Email")
  /// Forgot password?
  internal static let forgotPassword = L10n.tr("Localizable", "forgot_password", fallback: "Forgot password?")
  /// or
  internal static let or = L10n.tr("Localizable", "or", fallback: "or")
  /// Password
  internal static let passwordPlaceholder = L10n.tr("Localizable", "password_placeholder", fallback: "Password")
  /// Sign In
  internal static let signIn = L10n.tr("Localizable", "sign_in", fallback: "Sign In")
  /// Please enter a valid email
  internal static let signInEmailPrompt = L10n.tr("Localizable", "sign_in_email_prompt", fallback: "Please enter a valid email")
  /// Please enter a valid password
  internal static let signInPasswordPrompt = L10n.tr("Localizable", "sign_in_password_prompt", fallback: "Please enter a valid password")
  /// Sign Up
  internal static let signUp = L10n.tr("Localizable", "sign_up", fallback: "Sign Up")
  /// Please enter a valid email
  internal static let signUpEmailPrompt = L10n.tr("Localizable", "sign_up_email_prompt", fallback: "Please enter a valid email")
  /// Minimum 8 charactes with at least 1 lowercase letter, 1 uppercase, 1 digit and 1 special character
  internal static let signUpPasswordPrompt = L10n.tr("Localizable", "sign_up_password_prompt", fallback: "Minimum 8 charactes with at least 1 lowercase letter, 1 uppercase, 1 digit and 1 special character")
  /// Username
  internal static let usernamePlaceholder = L10n.tr("Localizable", "username_placeholder", fallback: "Username")
  /// Username must have at least 1 character
  internal static let usernamePrompt = L10n.tr("Localizable", "username_prompt", fallback: "Username must have at least 1 character")
  /// Verified password
  internal static let verifiedPasswordPlaceholder = L10n.tr("Localizable", "verified_password_placeholder", fallback: "Verified password")
  /// Passwords don't match
  internal static let verifiedPasswordPrompt = L10n.tr("Localizable", "verified_password_prompt", fallback: "Passwords don't match")
  /// Localizable.strings
  ///   Zaap
  /// 
  ///   Created by Christos Tzimas on 22/7/22.
  internal static let welcomeHeader = L10n.tr("Localizable", "welcome_header", fallback: "Welcome to Zaap!")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
