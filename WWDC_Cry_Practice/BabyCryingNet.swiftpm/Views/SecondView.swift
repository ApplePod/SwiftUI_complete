import SwiftUI
import AVFoundation


struct SecondView: View {
    
    @State var nextPage: Bool = false
    @State private var action: Int? = 0
    @State var navigationButtonOpacity = 0.0
    @State var backgroundOpacity = 0.0
    @State var nextPageButton = false
    
    
    @State var playImage1: String = "play1"
    @State var playImage2: String = "play2"
    @State var playImage3: String = "play3"
    @State var playImage4: String = "play4"
    @State var playImage5: String = "play5"
    @State var Isplay: Bool = false
    @State var playToggle: Bool = true
    

    @State var player: AVAudioPlayer!
    
    func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
        
        
        guard url != nil else {
            return
        }
        do {
            
            player = try AVAudioPlayer(contentsOf: url!)
            player.volume = 0.8

        } catch {
            print("error")
        }
        
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    
                    NavigationLink(destination: LoadingView(), tag: 2, selection: $action) {}
                    
                    HStack{
                        VStack (alignment: .leading){
                            
                            ZStack {
                                ZstackSecondVoxView(subtitle: "Infant cry analysis AI.", subtitleColor: .white, title: "Hi, I am Vox", titleSize: 50, bodyIsOn: true, bodyText: "I am an AI that analyzes the crying sounds of infants. I classify infant cries into five categories: hunger, discomfort, burp, tiredness, and pain. If you press the play button on the right, you can hear the baby's crying sound. Try to guess why the baby is crying, and the answer will be revealed on the next page.", bodyTextColor: .white, bodyTextSize: 23, bodyPaddingTop: 30, bodyWidth: 500)
                                    .background(RoundedRectangle(cornerRadius: 47, style: .continuous)
                                        .fill(Color(.black))
                                        .frame(width: 585, height: 550)
                                        .clipped(), alignment: .center)
                            }

                                Button {
                                    self.action = 2
                                    nextPageButton = true
                                } label: {
                                    Text("Vox, can you help me?")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: 280, height: 60)
                                        .foregroundColor(.white)
                                        .background(LinearGradient(colors: [.teal, .purple], startPoint: .leading, endPoint: .trailing))
                                        .clipShape(Capsule())
                                        .padding(.top, 20)
                                    
                                        
                                }
                                
                        }
                        
                        VStack{
                            SecondViewButtonStyle(voxSymbolIsOn: false, voxSymbolName: "", voxSymbolSize: 20, voxSymbolColor: .white, voxSymbolWidth: 180, voxSymbolHeight: 50, voxImage: playImage1, className: "Class 1", voxSubtitleIsOn: true, voxSubtitle: "Step 1", voxSubtitleSize: 10, voxSubtitleColor: .orange, voxTitle: "", voxTitleSize: 13, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                                .onTapGesture {
                                    playSound(sound: "tired")
                                    if Isplay == false {
                                        player?.play()
                                        self.playImage1 = "stop1"
                                        Isplay.toggle()
                                    } else {
                                       // player.stop()
                                        player?.stop()
                                        self.playImage1 = "play1"
                                        Isplay.toggle()
                                    }
                                }
                            
                            
                            
                            // Speaking Test vox
                            SecondViewButtonStyle(voxSymbolIsOn: false, voxSymbolName: "", voxSymbolSize: 20, voxSymbolColor: .white, voxSymbolWidth: 180, voxSymbolHeight: 50, voxImage: playImage2, className: "Class 2", voxSubtitleIsOn: true, voxSubtitle: "Step 1", voxSubtitleSize: 10, voxSubtitleColor: .orange, voxTitle: "", voxTitleSize: 13, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                                .onTapGesture {
                                    playSound(sound: "discomfort")
                                    if Isplay == false {
                                        player?.play()
                                        self.playImage2 = "stop2"
                                        Isplay.toggle()
                                    } else {
                                       // player.stop()
                                        player?.stop()
                                        self.playImage2 = "play2"
                                        Isplay.toggle()
                                    }

                                }
                            
                            // Handwriting Test vox
                            SecondViewButtonStyle(voxSymbolIsOn: false, voxSymbolName: "", voxSymbolSize: 20, voxSymbolColor: .white, voxSymbolWidth: 180, voxSymbolHeight: 50, voxImage: playImage3, className: "Class 3", voxSubtitleIsOn: true, voxSubtitle: "Step 1", voxSubtitleSize: 10, voxSubtitleColor: .orange, voxTitle: "", voxTitleSize: 13, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                                .onTapGesture {
                                    playSound(sound: "hungry")
                                    if Isplay == false {
                                        player?.play()
                                        self.playImage3 = "stop3"
                                        Isplay.toggle()
                                    } else {
                                       // player.stop()
                                        player?.stop()
                                        self.playImage3 = "play3"
                                        Isplay.toggle()
                                    }
                                }
                            
                            SecondViewButtonStyle(voxSymbolIsOn: false, voxSymbolName: "", voxSymbolSize: 20, voxSymbolColor: .white, voxSymbolWidth: 180, voxSymbolHeight: 50, voxImage: playImage4, className: "Class 4", voxSubtitleIsOn: true, voxSubtitle: "Step 1", voxSubtitleSize: 10, voxSubtitleColor: .orange, voxTitle: "", voxTitleSize: 13, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                                .onTapGesture {
                                    playSound(sound: "pain")
                                    if Isplay == false {
                                        player?.play()
                                        self.playImage4 = "stop4"
                                        Isplay.toggle()
                                    } else {
                                       // player.stop()
                                        player?.stop()
                                        self.playImage4 = "play4"
                                        Isplay.toggle()
                                    }
                                }
                            
                            
                            SecondViewButtonStyle(voxSymbolIsOn: false, voxSymbolName: "", voxSymbolSize: 20, voxSymbolColor: .white, voxSymbolWidth: 180, voxSymbolHeight: 50, voxImage: playImage5, className: "Class 5", voxSubtitleIsOn: true, voxSubtitle: "Step 1", voxSubtitleSize: 10, voxSubtitleColor: .orange, voxTitle: "", voxTitleSize: 13, voxTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                                .onTapGesture {
                                    playSound(sound: "burping")
                                    if Isplay == false {
                                        player?.play()
                                        self.playImage5 = "stop5"
                                        Isplay.toggle()
                                    } else {
                                       // player.stop()
                                        player?.stop()
                                        self.playImage5 = "play5"
                                        Isplay.toggle()
                                    }
                                }
                            
                            
                            Text("Can you classify?")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 24))
                            
                        }
                        
                    }

                    
                }.frame(width: geo.size.width, height: geo.size.height)
            }
        }.navigationViewStyle(.stack)
            .navigationBarBackButtonHidden(true)
    
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .preferredColorScheme(.dark)
    }
}
