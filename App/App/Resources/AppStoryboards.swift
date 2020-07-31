// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum DiscoverMovies: StoryboardType {
    internal static let storyboardName = "DiscoverMovies"

    internal static let initialScene = InitialSceneType<DiscoverMoviesVC>(storyboard: DiscoverMovies.self)

    internal static let campaigns = SceneType<DiscoverMoviesVC>(storyboard: DiscoverMovies.self, identifier: "Campaigns")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum SearchMovies: StoryboardType {
    internal static let storyboardName = "SearchMovies"

    internal static let initialScene = InitialSceneType<SearchMoviesVC>(storyboard: SearchMovies.self)

    internal static let campaigns = SceneType<SearchMoviesVC>(storyboard: SearchMovies.self, identifier: "Campaigns")
  }
  internal enum Splash: StoryboardType {
    internal static let storyboardName = "Splash"

    internal static let initialScene = InitialSceneType<SplashVC>(storyboard: Splash.self)
  }
  internal enum TabBar: StoryboardType {
    internal static let storyboardName = "TabBar"

    internal static let initialScene = InitialSceneType<TabBarVC>(storyboard: TabBar.self)

    internal static let tabBar = SceneType<TabBarVC>(storyboard: TabBar.self, identifier: "TabBar")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

private final class BundleToken {}
