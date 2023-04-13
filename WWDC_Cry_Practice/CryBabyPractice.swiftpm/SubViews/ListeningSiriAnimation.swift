import SwiftUI

struct ListeningSiriAnimation: View {
    @State var isRotating = false
    var scaleSize: CGFloat
    
    var body: some View {
        ZStack {
            ZStack {
//                Image("shadow")
//                Image("icon-bg")
                Image("Group1")
                    .rotationEffect(.degrees(isRotating ? -320 : -360))
                    .hueRotation(.degrees(isRotating ? -270 : 60))
                    
                Image("Group2")
                    .rotationEffect(.degrees(isRotating ? -360 : 180))
                    .hueRotation(.degrees(isRotating ? -220 : 300))
                    
                Image("Group3")
                    .rotationEffect(.degrees(isRotating ? -360 : 420))
                    .hueRotation(.degrees(isRotating ? -150 : 0))
                    .rotation3DEffect(.degrees(75), axis: (x: isRotating ? 1 : 5, y: 0, z: 0))
                
                Image("Grop4")
                    .rotationEffect(.degrees(isRotating ? -360 : 420))
                    .hueRotation(.degrees(isRotating ? 720 : -50))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: isRotating ? -5 : 15))
                
//                Image("Group5")
//                    .rotationEffect(.degrees(isRotating ? 30 : -420))
//                    .hueRotation(.degrees(isRotating ? 0 : 720))
//                    .rotation3DEffect(.degrees(15), axis: (x: 1, y: 1, z: 1), perspective: isRotating ? 5 : -5)
//
                Image("Group6")
                    .rotationEffect(.degrees(isRotating ? -300 : 360))
                    .hueRotation(.degrees(isRotating ? 300 : -15))
                    .rotation3DEffect(.degrees(15), axis: (x: 1, y: isRotating ? -1 : 1, z: 0), perspective: isRotating ? -1 : 1)
               

               

//                Image("bottom-pink")
//                    .rotationEffect(.degrees(isRotating ? 400 : -360))
//                    .hueRotation(.degrees(isRotating ? 0 : 230))
//                    .opacity(0.25)
//                    .blendMode(.multiply)
//                    .rotation3DEffect(.degrees(75), axis: (x: 5, y:isRotating ? 1 : -45, z: 0))
            }
            //.blendMode(isRotating ? .hardLight : .difference )
            
            Image("highlight")
                .resizable()
                .frame(width: 20, height: 20)
                .rotationEffect(.degrees(isRotating ? 360 : 250))
                .hueRotation(.degrees(isRotating ? 0 : 230))
                .onAppear{
                    withAnimation(.easeInOut(duration: 9).repeatForever(autoreverses: true)) {
                        isRotating.toggle()
                    }
                }
        }.scaleEffect(scaleSize)
        .frame(width: 100, height: 100)
    }
}
//
//struct ListeningSiriAnimation_Previews: PreviewProvider {
//    static var previews: some View {
//        ListeningSiriAnimation()
//            .preferredColorScheme(.dark)
//    }
//}