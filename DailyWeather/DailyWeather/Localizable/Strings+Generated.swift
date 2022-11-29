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
    /// Search History
    internal static let searchHistory = L10n.tr("Localizable", "search_history", fallback: "Search History")
    /// Daily Weather
    internal static let splashTitle = L10n.tr("Localizable", "splash_title", fallback: "Daily Weather")
    /// Unknown error occured
    internal static let unknownNetworkErrorMessage = L10n.tr("Localizable", "unknown_network_error_message", fallback: "Unknown error occured")
    /// Atmo. Pressure
    internal static let weatherAtmoPress = L10n.tr("Localizable", "weather_atmoPress", fallback: "Atmo. Pressure")
    /// Wind Chill
    internal static let weatherFeelsLike = L10n.tr("Localizable", "weather_feelsLike", fallback: "Wind Chill")
    /// Humidity
    internal static let weatherHumidity = L10n.tr("Localizable", "weather_humidity", fallback: "Humidity")
    /// Sunrise
    internal static let weatherSunRise = L10n.tr("Localizable", "weather_sunRise", fallback: "Sunrise")
    /// Sunset
    internal static let weatherSunSet = L10n.tr("Localizable", "weather_sunSet", fallback: "Sunset")
    /// Wind Speed
    internal static let weatherWindSpeed = L10n.tr("Localizable", "weather_windSpeed", fallback: "Wind Speed")
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
      internal static let circle = L10n.tr("Resources", "Image.circle", fallback: "circle.fill")
      /// cloud.fill
      internal static let cloud = L10n.tr("Resources", "Image.cloud", fallback: "cloud.fill")
      /// cloud.bolt.fill
      internal static let extreme = L10n.tr("Resources", "Image.extreme", fallback: "cloud.bolt.fill")
      /// globe
      internal static let globe = L10n.tr("Resources", "Image.globe", fallback: "globe")
      /// humidity
      internal static let humidity = L10n.tr("Resources", "Image.humidity", fallback: "humidity")
      /// person.fill
      internal static let person = L10n.tr("Resources", "Image.person", fallback: "person.fill")
      /// speedometer
      internal static let pressure = L10n.tr("Resources", "Image.pressure", fallback: "speedometer")
      /// cloud.rain.fill
      internal static let rain = L10n.tr("Resources", "Image.rain", fallback: "cloud.rain.fill")
      /// cloud,snow,fill
      internal static let snow = L10n.tr("Resources", "Image.snow", fallback: "cloud,snow,fill")
      /// sun.max.fill
      internal static let sunFillMax = L10n.tr("Resources", "Image.sun_fill_max", fallback: "sun.max.fill")
      /// sunrise.fill
      internal static let sunrise = L10n.tr("Resources", "Image.sunrise", fallback: "sunrise.fill")
      /// sunset.fill
      internal static let sunset = L10n.tr("Resources", "Image.sunset", fallback: "sunset.fill")
      /// wind
      internal static let windSpeed = L10n.tr("Resources", "Image.wind_speed", fallback: "wind")
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
