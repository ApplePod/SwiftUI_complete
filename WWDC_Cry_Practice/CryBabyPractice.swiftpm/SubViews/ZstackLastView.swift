import SwiftUI

struct ZstackLastView: View {
    
    var cardSymbolIsOn: Bool
    var cardSymbolName: String
    var cardSymbolSize: CGFloat
    var cardSymbolColor: Color
    var cardSymbolWidth: CGFloat
    var cardSymbolHeight: CGFloat
    var cardImage: String
    
    var cardSubtitleIsOn: Bool
    var cardSubtitle: String
    var cardSubtitleSize: CGFloat
    var cardSubtitleColor: Color
    
    var cardTitle: String
    var cardTitleSize: CGFloat
    var cardTitleColor: Color
    var paddingTop: CGFloat
    
    var animationDuration: Double
    
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    var backgroundColor: Color
    
    @State var cardOpacity = 0.0
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            if cardSymbolIsOn {

                Image(systemName: cardSymbolName)
                    .imageScale(.large)
                    .font(.system(size: cardSymbolSize, weight: .semibold, design: .default))
                    .frame(width: cardSymbolWidth, height: cardSymbolHeight)
                    .clipped()
                    .foregroundColor(cardSymbolColor)

            }  else {
                Image("\(cardImage)")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: cardSymbolWidth - 20, height: cardSymbolHeight)
                    .clipped()
            }
            
            VStack(alignment: .leading) {
                
                Text(cardTitle)
                    .font(.system(size: cardTitleSize, weight: .bold, design: .default))
                    .foregroundColor(cardTitleColor)
                    .padding(.top, paddingTop)
                    .multilineTextAlignment(.center)
                    .frame(width: 130)
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

