import SwiftUI
import FirebaseCore
import OneSignalFramework

class AppDelegate: NSObject, UIApplicationDelegate {
    private var externalId = UUID().uuidString
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        OneSignal.initialize("17eea47e-2ccf-469e-8d46-044cf6de520b", withLaunchOptions: launchOptions)
        OneSignal.Notifications.requestPermission({ accepted in }, fallbackToSettings: true)
        
        let id = UserDefaults.standard.string(forKey: "external_id")
        if id == nil {
            UserDefaults.standard.set(externalId, forKey: "external_id")
        } else {
            externalId = id!
        }
        
        return true
    }
}
