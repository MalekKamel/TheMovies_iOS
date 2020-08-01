// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {
  /// Can't be less than
  public static let canNotBeLessThan = L10n.tr("Localizable", "can_not_be_less_than")
  /// Can't ne more than
  public static let canNotBeMoreThan = L10n.tr("Localizable", "can_not_be_more_than")
  /// Cancel
  public static let cancel = L10n.tr("Localizable", "cancel")
  /// Discover
  public static let discover = L10n.tr("Localizable", "Discover")
  /// Invalid
  public static let invalid = L10n.tr("Localizable", "Invalid")
  /// Invalid e-mail Address
  public static let invalidEMailAddress = L10n.tr("Localizable", "Invalid e-mail Address")
  /// Last name cannot be empty
  public static let lastNameCannotBeEmpty = L10n.tr("Localizable", "Last name cannot be empty")
  /// Last name cannot be less than 3 letters
  public static let lastNameCannotBeLessThan3Letters = L10n.tr("Localizable", "Last name cannot be less than 3 letters")
  /// Last name is invalid
  public static let lastNameIsInvalid = L10n.tr("Localizable", "Last name is invalid")
  /// Must be
  public static let mustBe = L10n.tr("Localizable", "must_be")
  /// Not matching
  public static let notMatching = L10n.tr("Localizable", "not_matching")
  /// OOPS! something went wrong.
  public static let oopsSomethingWentWrong = L10n.tr("Localizable", "oops_something_went_wrong")
  /// Required
  public static let `required` = L10n.tr("Localizable", "Required")
  /// Search
  public static let search = L10n.tr("Localizable", "Search")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
