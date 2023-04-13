import SwiftUI

struct LoadingView: View {
    @State private var action: Int? = 0
    @State var value: Float = 0
    
    var body: some View {
        
        NavigationView {
            VStack{
                NavigationLink(destination: ThirdView(), tag: 1, selection: $action) {
                    
                }
                ProgressView("Deep learning processing", value: min(max(value, 0), 100), total: 100)
                    .progressViewStyle(LinearProgressViewStyle())
                    .padding()
                    .frame(width: 300)
                    .onAppear {
                        // 2
                        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                            self.value += 25
                            
                            if self.value > 100 {
                                self.action = 1
                                timer.invalidate()
                            }
                        }
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(.stack)
    }
}
