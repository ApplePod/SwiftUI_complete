import SwiftUI

struct ZstackLastView: View {
    
    var voxSymbolIsOn: Bool
    var voxSymbolName: String
    var voxSymbolSize: CGFloat
    var voxSymbolColor: Color
    var voxSymbolWidth: CGFloat
    var voxSymbolHeight: CGFloat
    var voxImage: String
    
    var voxSubtitleIsOn: Bool
    var voxSubtitle: String
    var voxSubtitleSize: CGFloat
    var voxSubtitleColor: Color
    
    var voxTitle: String
    var voxTitleSize: CGFloat
    var voxTitleColor: Color
    var paddingTop: CGFloat
    
    var animationDuration: Double
    
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    var backgroundColor: Color
    
    @State var voxOpacity = 0.0
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            if voxSymbolIsOn {

                Image(systemName: voxSymbolName)
                    .imageScale(.large)
                    .font(.system(size: voxSymbolSize, weight: .semibold, design: .default))
                    .frame(width: voxSymbolWidth, height: voxSymbolHeight)
                    .clipped()
                    .foregroundColor(voxSymbolColor)

            }  else {
                Image("\(voxImage)")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: voxSymbolWidth - 20, height: voxSymbolHeight)
                    .clipped()
            }
            
            VStack(alignment: .leading) {
                
                Text(voxTitle)
                    .font(.system(size: voxTitleSize, weight: .bold, design: .default))
                    .foregroundColor(voxTitleColor)
                    .padding(.top, paddingTop)
                    .multilineTextAlignment(.center)
                    .frame(width: 130)
            }
        }
        .background(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(backgroundColor)
                    .frame(width: width, height: height)
                    .clipped(), alignment: .center)
        
        .opacity(voxOpacity)
        .basicEaseIn(delayCount: animationDuration) {
            voxOpacity = 1.0
        }
    }
    
}

