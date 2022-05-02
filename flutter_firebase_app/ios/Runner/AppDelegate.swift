import UIKit
import Flutter
import Firebase     // import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    FirebaseApp.configure()     // import Firebase
//     GIDSignIn.sharedInstance().clientID = "378434911546-u64htjn5aldjphceb2o433qoa0lhuore.apps.googleusercontent.com"

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
