import SwiftUI

@main
struct MyApp: App {
    
    @State private var showingAlert = true
    
    var body: some Scene {
        WindowGroup {
            WelcomeScene()
                .preferredColorScheme(.dark)
//                .alert(isPresented: $showingAlert) {
//                    Alert(title: Text("Orientation Warning"),
//                          message: Text("Please use this app in landscape mode and if you change the orientation of the device please restart the app."),
//                          
//                          dismissButton: .default(Text("OK")))
//                }
        }
    }
}
