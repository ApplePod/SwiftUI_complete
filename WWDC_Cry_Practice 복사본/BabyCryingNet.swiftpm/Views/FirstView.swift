import SwiftUI

struct FirstView: View {
    
    @State private var action: Int? = 0
    @State var navigationButtonOpacity = 0.0
    @State var isRotating = true
    @State private var isActive = false
    
    var body: some View {
        
        
        NavigationView {
            
            GeometryReader { geo in
                
                VStack() {
                    
                   
                    
                    NavigationLink(destination: SecondView(), tag: 1, selection: $action) {}
                    
                    Spacer()
                    VStack {
                        ZstackIntroView(subtitle: "", subtitleColor: Color.white, title: "BabyCryNetAI", titleSize: 36, bodyIsOn: true, bodyText: "As we nurture children, we inevitably reach the boundaries of our observation and physical capacity. However, technology is available to transcend these limitations and extend our capabilities.", bodyTextColor: Color.secondary, bodyTextSize: 23, bodyPaddingTop: 5, bodyWidth: 800)
                            .frame(height: 200)
                        
                        HStack(spacing: 30) {
                            ZstackView(voxSymbolIsOn: true, voxSymbolName: "figure.2.and.child.holdinghands", voxSymbolSize: 70, voxSymbolColor: .white, voxSymbolWidth: 250, voxSymbolHeight: 166, voxImage: "", voxSubtitleIsOn: true, voxSubtitle: "", voxSubtitleSize: 15, voxSubtitleColor: .white, voxTitle: "We want to give our parents the gift of freedom.", voxTitleSize: 22, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 250, height: 250, cornerRadius: 40, backgroundColor: .black)
                                .frame(height: 300)
                            
                            
                            ZstackVox(voxSymbolIsOn: true, voxSymbolName: "", voxSymbolSize: 70, voxSymbolColor: .white, voxSymbolWidth: 250, voxSymbolHeight: 166, voxImage: "", voxSubtitleIsOn: true, voxSubtitle: "", voxSubtitleSize: 15, voxSubtitleColor: .white, voxTitle: "Real-time analysis of an infant's crying sound.", voxTitleSize: 22, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.7, width: 250, height: 250, cornerRadius: 40, backgroundColor: .black)
                                .frame(height: 300)
                            
                            ZstackView(voxSymbolIsOn: false, voxSymbolName: "", voxSymbolSize: 70, voxSymbolColor: .white, voxSymbolWidth: 250, voxSymbolHeight: 166, voxImage: "tired", voxSubtitleIsOn: false, voxSubtitle: "", voxSubtitleSize: 0, voxSubtitleColor: .white, voxTitle: "AI classifies sounds into six different categories.", voxTitleSize: 22, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.8, width: 250, height: 250, cornerRadius: 40, backgroundColor: .black)
                                .frame(height: 300)
                        }
                       
                        
                        
                        Button {
                            self.action = 1
                        } label: {
                            Text("Get Started")
                                .bold()
                                .font(.title3)
                                .frame(width: 280, height: 60)
                                .foregroundColor(.white)
                                .background(LinearGradient(colors: [.teal, .purple], startPoint: .leading, endPoint: .trailing))
                                .clipShape(Capsule())
                            
                        }
                        
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height / 2)
                    
                    Spacer()
                    
                }
            }
        }.navigationViewStyle(.stack)
            .navigationBarBackButtonHidden(true)
        
    }
}




struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
            .preferredColorScheme(.dark)
    }
}
