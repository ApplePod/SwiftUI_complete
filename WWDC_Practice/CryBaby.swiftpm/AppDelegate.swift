import AVFoundation
import UIKit


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            audioSession.requestRecordPermission { (granted) in
                if granted {
                    // microphone access granted
                    print("Microphone access granted")
                } else {
                    // microphone access denied
                    print("Microphone access denied")
                }
            }
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
        return true
    }
}
