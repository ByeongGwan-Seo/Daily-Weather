// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Localizable {
    /// Localizable.strings
    ///   DailyWeather
    /// 
    ///   Created by snowman on 2022/11/17.
    internal static let badUrlResponseErrorMessage = L10n.tr("Localizable", "bad_url_response_error_message", fallback: "Bad response from URL")
    /// Seoul
    internal static let searchListItem1 = L10n.tr("Localizable", "search_list_item_1", fallback: "Seoul")
    /// Tokyo
    internal static let searchListItem2 = L10n.tr("Localizable", "search_list_item_2", fallback: "Tokyo")
    /// Osaka
    internal static let searchListItem3 = L10n.tr("Localizable", "search_list_item_3", fallback: "Osaka")
    /// Unknown error occured
    internal static let unknownNetworkErrorMessage = L10n.tr("Localizable", "unknown_network_error_message", fallback: "Unknown error occured")
    /// ※ Please enter the city name in English
    internal static let welcomeCautionDescription = L10n.tr("Localizable", "welcome_caution_description", fallback: "※ Please enter the city name in English")
    /// confirm
    internal static let welcomeConfirmButtonTitle = L10n.tr("Localizable", "welcome_confirm_button_title", fallback: "confirm")
    /// Please enter the name of the area you want to check
    internal static let welcomeConfirmTitle = L10n.tr("Localizable", "welcome_confirm_title", fallback: "Please enter the name of the area you want to check")
    /// welcome to Daily Weather
    internal static let welcomeMainTitle = L10n.tr("Localizable", "welcome_main_title", fallback: "welcome to Daily Weather")
  }
  internal enum Resources {
    internal enum Image {
      /// Resources.strings
      ///   DailyWeather
      /// 
      ///   Created by 金峻聖 on 2022/11/24.
      internal static let globe = L10n.tr("Resources", "Image.globe", fallback: "globe")
      internal enum Sun {
        internal enum Fill {
          /// sun_fill
          internal static let max = L10n.tr("Resources", "Image.sun.fill.max", fallback: "sun_fill")
        }
      }
    }
  }
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
