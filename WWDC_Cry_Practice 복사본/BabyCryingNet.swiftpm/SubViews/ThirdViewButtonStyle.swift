import SwiftUI

struct ThirdViewButtonStyle: View {
    
    var voxSymbolIsOn: Bool
    var voxSymbolName: String
    var voxSymbolSize: CGFloat
    var voxSymbolColor: Color
    var voxSymbolWidth: CGFloat
    var voxSymbolHeight: CGFloat
    var voxImage:String
    var className: String
    
    
    var resultImage: String
    var resultImageWidth: CGFloat
    var resultImageHeight: CGFloat

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
            
            
            Image(resultImage)
                .resizable()
                .frame(width: resultImageWidth, height: resultImageHeight)
        
            

            if voxSymbolIsOn {

                Image(systemName: voxSymbolName)
                    .imageScale(.large)
                    .font(.system(size: voxSymbolSize, weight: .semibold, design: .default))
                    .frame(width: voxSymbolWidth, height: voxSymbolHeight)
                    .clipped()
                    .foregroundColor(voxSymbolColor)
                

            }  else {
                
             
                    Text("\(className)")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 24))
                    
                    Image("\(voxImage)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .imageScale(.large)
                        .cornerRadius(20)
                        .frame(width: voxSymbolWidth - 20, height: voxSymbolHeight)
                        .clipped()
       
                

                VStack(alignment: .leading) {

                    Text(voxTitle)
                        .font(.system(size: voxTitleSize, weight: .bold, design: .default))
                        .foregroundColor(voxTitleColor)
                        .padding(.top, paddingTop)
                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                }
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

