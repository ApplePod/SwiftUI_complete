import SwiftUI

struct IntroView: View {
    
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
                .font(.system(size: 25, weight: .semibold, design: .default))
                .foregroundColor(subtitleColor)
                .opacity(subtitleOpacity)
                .basicEaseIn(delayCount: 0) {
                    subtitleOpacity = 1.0
                }
            
            // Title
            Text(title)
                .font(.system(size: titleSize, weight: .bold, design: .default))
                .foregroundColor(Color.primary)
                .padding(.top, 5)
                .opacity(titleOpacity)
                .basicEaseIn(delayCount: 0.2) {
                    titleOpacity = 1.0
                }
            
            // Body Text Existance Control Point
            if bodyIsOn {
                Text(bodyText)
                    .foregroundColor(bodyTextColor)
                    .frame(width: bodyWidth, alignment: .leading)
                    .clipped()
                    .font(.system(size: bodyTextSize, weight: .medium, design: .default))
                    .padding(.top, bodyPaddingTop)
                    .opacity(bodyTextOpacity)
                    .basicEaseIn(delayCount: 0.4) {
                        bodyTextOpacity = 1.0
                    }
            }
        }
    }
    
}

public extension View {
    func basicEaseIn(using animation: Animation = Animation.easeIn(duration: 1), delayCount: Double, _ action: @escaping () -> Void) -> some View {
        let delay = animation.delay(delayCount)
        
        return onAppear {
            withAnimation(delay) {
                action()
            }
        }
    }
    
}
