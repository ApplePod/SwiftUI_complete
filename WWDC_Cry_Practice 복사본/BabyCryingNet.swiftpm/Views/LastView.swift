import SwiftUI

struct LastView: View {
    
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: -15) {
                    NavigationLink(destination: FirstView(), tag: 6, selection: $action) {}
                    
                    ZstackIntroView(subtitle: "", subtitleColor: Color.white, title: "Training Sound Classification Models in Create ML", titleSize: 32, bodyIsOn: true, bodyText: "If you want to analyze sounds to solve a problem, you can refer to the following method. Create ML is a tool that makes it easy for non-experts to create machine learning models for use with Core ML on Mac hardware. Create ML takes the complexity out of model training while creating powerful Core ML models.", bodyTextColor: Color.secondary, bodyTextSize: 21, bodyPaddingTop: 5, bodyWidth: 800)
                        .frame(height: 180)

                    
                    HStack{
                        
                        Spacer()
                        ZstackView(voxSymbolIsOn: false, voxSymbolName: "", voxSymbolSize: 70, voxSymbolColor: .white, voxSymbolWidth: 450, voxSymbolHeight: 300, voxImage: "leftSide2", voxSubtitleIsOn: false, voxSubtitle: "", voxSubtitleSize: 0, voxSubtitleColor: .white, voxTitle: "", voxTitleSize: 22, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.8, width: 250, height: 250, cornerRadius: 40, backgroundColor: .black)
                            .padding(.leading, 20)
                            .offset(x: 25)
                        
                        
                        
                        VStack{
                            
                            
                            
                            VoxAnimationView(scaleSize: 0.4)
                                .frame(width: 200, height: 100)
                                .offset(x: -5, y: 30)
                            
                            Text("Create ML Model")
                                .font(.title3)
                                .offset(x: 15, y: 70)
                        }
                       
                        ZstackView(voxSymbolIsOn: false, voxSymbolName: "", voxSymbolSize: 70, voxSymbolColor: .white, voxSymbolWidth: 200, voxSymbolHeight: 200, voxImage: "rightSide", voxSubtitleIsOn: false, voxSubtitle: "", voxSubtitleSize: 0, voxSubtitleColor: .white, voxTitle: "", voxTitleSize: 22, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.8, width: 250, height: 250, cornerRadius: 40, backgroundColor: .black)
                            .offset(x: -40)
                
                        
                        Spacer()
                    }
                    
                    
                    ZstackIntroView(subtitle: "", subtitleColor: Color.white, title: "", titleSize: 36, bodyIsOn: true, bodyText: "Create ML has many different model types to choose from. You can create your own model in the app by simply selecting a model type and adding data. Give it a try.", bodyTextColor: Color.secondary, bodyTextSize: 21, bodyPaddingTop: 5, bodyWidth: 800)
                        .frame(height: 100)
                        .padding(.bottom, 40)
                    
                    HStack(){
                        
                        ZstackLastView(voxSymbolIsOn: true, voxSymbolName: "photo.fill", voxSymbolSize: 40, voxSymbolColor: .white, voxSymbolWidth: 70, voxSymbolHeight: 70, voxImage: "", voxSubtitleIsOn: true, voxSubtitle: "", voxSubtitleSize: 15, voxSubtitleColor: .white, voxTitle: "Image", voxTitleSize: 20, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 100, height: 100, cornerRadius: 40, backgroundColor: .black)
                        
                        ZstackLastView(voxSymbolIsOn: true, voxSymbolName: "video", voxSymbolSize: 40, voxSymbolColor: .white, voxSymbolWidth: 70, voxSymbolHeight: 70, voxImage: "", voxSubtitleIsOn: true, voxSubtitle: "", voxSubtitleSize: 15, voxSubtitleColor: .white, voxTitle: "Video", voxTitleSize: 20, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 100, height: 100, cornerRadius: 40, backgroundColor: .black)
                        
                        ZstackLastView(voxSymbolIsOn: true, voxSymbolName: "figure.walk.motion", voxSymbolSize: 40, voxSymbolColor: .white, voxSymbolWidth: 70, voxSymbolHeight: 70, voxImage: "", voxSubtitleIsOn: true, voxSubtitle: "", voxSubtitleSize: 15, voxSubtitleColor: .white, voxTitle: "Motion", voxTitleSize: 20, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 100, height: 100, cornerRadius: 40, backgroundColor: .black)
                        
                        ZstackLastView(voxSymbolIsOn: true, voxSymbolName: "waveform", voxSymbolSize: 40, voxSymbolColor: .white, voxSymbolWidth: 70, voxSymbolHeight: 70, voxImage: "", voxSubtitleIsOn: true, voxSubtitle: "", voxSubtitleSize: 15, voxSubtitleColor: .white, voxTitle: "Sound", voxTitleSize: 20, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 100, height: 100, cornerRadius: 40, backgroundColor: .black)
                        
                        ZstackLastView(voxSymbolIsOn: true, voxSymbolName: "doc.text.magnifyingglass", voxSymbolSize: 40, voxSymbolColor: .white, voxSymbolWidth: 70, voxSymbolHeight: 70, voxImage: "", voxSubtitleIsOn: true, voxSubtitle: "", voxSubtitleSize: 15, voxSubtitleColor: .white, voxTitle: "Text", voxTitleSize: 20, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 100, height: 100, cornerRadius: 40, backgroundColor: .black)
                        
                        ZstackLastView(voxSymbolIsOn: true, voxSymbolName: "tablecells", voxSymbolSize: 40, voxSymbolColor: .white, voxSymbolWidth: 70, voxSymbolHeight: 70, voxImage: "", voxSubtitleIsOn: true, voxSubtitle: "", voxSubtitleSize: 15, voxSubtitleColor: .white, voxTitle: "Table", voxTitleSize: 20, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 100, height: 100, cornerRadius: 40, backgroundColor: .black)

                           
                    }
                    .padding(.bottom, 30)
                    
                    Button(action: {
                        self.action = 6
                    }, label: {
                        Text("Go home")
                            .bold()
                            .font(.title3)
                            .frame(width: 280, height: 60)
                            .foregroundColor(.white)
                            .background(LinearGradient(colors: [.teal, .purple], startPoint: .leading, endPoint: .trailing))
                            .clipShape(Capsule())
                        
                    })
                    
                    
                }.frame(width: geo.size.width, height: geo.size.height)
            }
        }.navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}

struct LastView_Previews: PreviewProvider {
    static var previews: some View {
        LastView()
            .preferredColorScheme(.dark)
    }
}
