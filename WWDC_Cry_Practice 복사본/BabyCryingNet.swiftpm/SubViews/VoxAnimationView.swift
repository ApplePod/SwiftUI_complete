import SwiftUI

struct VoxAnimationView: View {
    @State var isRotating = false
    var scaleSize: CGFloat
    
    var body: some View {
        ZStack {
            
            GeometryReader{ geo in
                ZStack {
                    
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
                    
                    Image("Group6")
                        .rotationEffect(.degrees(isRotating ? -300 : 360))
                        .hueRotation(.degrees(isRotating ? 300 : -15))
                        .rotation3DEffect(.degrees(15), axis: (x: 1, y: isRotating ? -1 : 1, z: 0), perspective: isRotating ? -1 : 1)
                    
                    
                    Image("highlight")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .rotationEffect(.degrees(isRotating ? 360 : 250))
                        .hueRotation(.degrees(isRotating ? 0 : 230))
                        .onAppear{
                            withAnimation(.easeIn(duration: 7).repeatForever(autoreverses: true)) {
                                isRotating.toggle()
                            }
                        }
                }

            }
        

        }.scaleEffect(scaleSize)
    }
}
