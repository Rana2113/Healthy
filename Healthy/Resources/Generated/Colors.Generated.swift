// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Colors {
  internal static let black100 = ColorAsset(name: "Black 100")
  internal static let black20 = ColorAsset(name: "Black 20")
  internal static let black40 = ColorAsset(name: "Black 40")
  internal static let black60 = ColorAsset(name: "Black 60")
  internal static let black80 = ColorAsset(name: "Black 80")
  internal static let success = ColorAsset(name: "Success")
  internal static let warningLight = ColorAsset(name: "Warning light")
  internal static let warning = ColorAsset(name: "Warning")
  internal static let black = ColorAsset(name: "black")
  internal static let gray1 = ColorAsset(name: "gray 1")
  internal static let gray2 = ColorAsset(name: "gray 2")
  internal static let gray3 = ColorAsset(name: "gray 3")
  internal static let gray4 = ColorAsset(name: "gray 4")
  internal static let primary100 = ColorAsset(name: "primary 100")
  internal static let primary20 = ColorAsset(name: "primary 20")
  internal static let primary40 = ColorAsset(name: "primary 40")
  internal static let primary60 = ColorAsset(name: "primary 60")
  internal static let primary80 = ColorAsset(name: "primary 80")
  internal static let rating = ColorAsset(name: "rating")
  internal static let secondary100 = ColorAsset(name: "secondary 100")
  internal static let secondary20 = ColorAsset(name: "secondary 20")
  internal static let secondary40 = ColorAsset(name: "secondary 40")
  internal static let secondary60 = ColorAsset(name: "secondary 60")
  internal static let secondary80 = ColorAsset(name: "secondary 80")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = Color(asset: self)

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
