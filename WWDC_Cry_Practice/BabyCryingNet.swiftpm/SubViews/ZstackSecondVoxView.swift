import SwiftUI

struct ZstackSecondVoxView: View {
    
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
        
            VStack(alignment: .leading, spacing: 0) {
                Text(subtitle)
                    .font(.title)
                    .foregroundColor(subtitleColor)
                    .opacity(subtitleOpacity)
                    .basicEaseIn(delayCount: 0) {
                        subtitleOpacity = 1.0
                    }
                
                // Title
                HStack{
                    
                    Text(title)
                        .font(.title)
                        .foregroundColor(Color.primary)
                        .padding(.top, 5)
                        .opacity(titleOpacity)
                        .basicEaseIn(delayCount: 0.2) {
                            titleOpacity = 1.0
                        }
                    
                    VoxAnimationView(scaleSize: 0.6)
                        .offset(x: 100, y: -120)
                        .frame(width: 100, height: 20)
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
            .padding(.horizontal, 10)
           

       
    }
        
    
}
