import SwiftUI

struct ThirdViewButtonStyle: View {
    
    // MARK: Symbol Properties
    var cardSymbolIsOn: Bool
    var cardSymbolName: String
    var cardSymbolSize: CGFloat
    var cardSymbolColor: Color
    var cardSymbolWidth: CGFloat
    var cardSymbolHeight: CGFloat
    var cardImage:String
    var className: String
    
    
    var resultImage: String
    var resultImageWidth: CGFloat
    var resultImageHeight: CGFloat
    
    // MARK: Subtitle Properties
    var cardSubtitleIsOn: Bool
    var cardSubtitle: String
    var cardSubtitleSize: CGFloat
    var cardSubtitleColor: Color
    
    // MARK: Title Properties
    var cardTitle: String
    var cardTitleSize: CGFloat
    var cardTitleColor: Color
    var paddingTop: CGFloat
    
    // MARK: Animation Properties
    var animationDuration: Double
    
    // MARK: Background Properties
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    var backgroundColor: Color
    
    // MARK: Animation Properties
    @State var cardOpacity = 0.0
    
    // MARK: View
    
    var body: some View {
        VStack(spacing: 0) {
            
            
            Image(resultImage)
                .resizable()
                .frame(width: resultImageWidth, height: resultImageHeight)
        
            
            // Card Symbol Existance Control Point
            if cardSymbolIsOn {
                // Symbol
                Image(systemName: cardSymbolName)
                    .imageScale(.large)
                    .font(.system(size: cardSymbolSize, weight: .semibold, design: .default))
                    .frame(width: cardSymbolWidth, height: cardSymbolHeight)
                    .clipped()
                    .foregroundColor(cardSymbolColor)
                

            }  else {
                Text("\(className)")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 28))
                
                Image("\(cardImage)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .imageScale(.large)
                    .cornerRadius(20)
                    .frame(width: cardSymbolWidth - 20, height: cardSymbolHeight)
                    .clipped()
            }
            
            // Subtitle and Title.
            VStack(alignment: .leading) {
                
//                // Card Subtitle Existance Control Point
//                if cardSubtitleIsOn {
//                    // Subtitle
//                    Text(cardSubtitle)
//                        .font(.system(size: cardSubtitleSize, weight: .semibold, design: .default))
//                        .foregroundColor(cardSubtitleColor)
//                        .multilineTextAlignment(.center)
//                }
                
                // Title
                Text(cardTitle)
                    .font(.system(size: cardTitleSize, weight: .bold, design: .default))
                    .foregroundColor(cardTitleColor)
                    .padding(.top, paddingTop)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
            }
        }
        .background(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(backgroundColor)
                    .frame(width: width, height: height)
                    .clipped(), alignment: .center)
        
        .opacity(cardOpacity)
        .basicEaseIn(delayCount: animationDuration) {
            cardOpacity = 1.0
        }
    }
    
}

