import UIKit
import Flutter
import GoogleMaps  // import Google Maps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // TODO: Add your Google Maps API key here
    GMSServices.provideAPIKey("AIzaSyBF3yTwKe6Zsh2acq4EJO6G25USC_cDeaI")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
