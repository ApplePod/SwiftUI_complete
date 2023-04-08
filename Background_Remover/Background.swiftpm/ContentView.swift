import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct ContentView: View {

    
    private let adaptiveCoulumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        
        NavigationView {
            
            PickerView()
            AnimatedText()

        }.padding()
    }
}

import SwiftUI

import SwiftUI

struct AnimatedText: View {
    let sentences = [
        "첫 번째 문장입니다.",
        "두 번째 문장입니다.",
        "세 번째 문장입니다."
    ]
    
    @State private var currentIndex = 0
    @State private var showNextScreenButton = false
    
    var body: some View {
        VStack {
            Text(sentences[currentIndex])
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .opacity(currentIndex == 0 ? 0.2 : 1.0)
                .animation(.easeInOut(duration: 1.0))
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
                        withAnimation {
                            if currentIndex < sentences.count - 1 {
                                currentIndex += 1
                            } else {
                                timer.invalidate()
                                showNextScreenButton = true
                            }
                        }
                    }
                }
                .padding()
//                .background(Color.black.edgesIgnoringSafeArea(.all))
            
            if showNextScreenButton {
                    NavigationLink(destination: ImageView()) {
                        Text("다음 화면으로")
                            .padding()
                    }
            }
        }
    }
}




@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
   
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


