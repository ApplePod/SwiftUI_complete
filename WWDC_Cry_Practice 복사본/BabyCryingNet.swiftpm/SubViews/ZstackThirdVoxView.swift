import SwiftUI

struct ZstackThirdVoxView: View {
    
    var subtitle: String
    var subtitleColor: Color
    
    var title: String
    var titleSize: CGFloat
    
    var bodyIsOn: Bool
    var bodyText: String
    var bodyTextColor: Color
    var bodyTextSize: CGFloat
    var bodyPaddingTop: CGFloat
    var bodyWidth: CGFloat
    
    @State var subtitleOpacity = 0.0
    @State var titleOpacity = 0.0
    @State var bodyTextOpacity = 0.0
    

    var body: some View {
        
            VStack(alignment: .center, spacing: 0) {
                
                VoxAnimationView(scaleSize: 0.6)
                    .frame(width: 200, height: 180)
                    .offset(x: -20)
                
                Text(subtitle)
                    .font(.title)
                    .foregroundColor(subtitleColor)
                    .opacity(subtitleOpacity)
                    .basicEaseIn(delayCount: 0) {
                        subtitleOpacity = 1.0
                    }
                
                    
                    Text(title)
                        .font(.title)
                        .foregroundColor(Color.primary)
                        .padding(.top, 5)
                        .opacity(titleOpacity)
                        .basicEaseIn(delayCount: 0.2) {
                            titleOpacity = 1.0
                        }
                    
                
                // Body Text Existance Control Point
                if bodyIsOn {
                    Text(bodyText)
                        .foregroundColor(.white)
                        .frame(width: bodyWidth , alignment: .center)
                        .clipped()
                        .font(.title2)
                        .padding(.top, bodyPaddingTop)
                        .opacity(bodyTextOpacity)
                        .basicEaseIn(delayCount: 0.4) {
                            bodyTextOpacity = 1.0
                        }
                }
            }
            .padding(.horizontal, 20)
           

       
    }
        
    
}
