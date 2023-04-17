
import SwiftUI
import AVKit

struct ThirdView: View {
    
    @State var navigationButtonOpacity = 0.0
    @State var backgroundOpacity = 0.0
    @State private var action: Int? = 0
    @State var analyzeResultImage1: String = "tired"
    @State var analyzeResultImage2: String = "discomfort"
    @State var analyzeResultImage3: String = "hunger"
    @State var analyzeResultImage4: String = "pain"
    @State var analyzeResultImage5: String = "burping"
    @State var analyzeResultImage6: String = "laugh"
    
    @State var nextPageButton = false
    
    @State var playImage1: String = "play1"
    @State var playImage2: String = "play2"
    @State var playImage3: String = "play3"
    @State var playImage4: String = "play4"
    @State var playImage5: String = "play5"
    @State var playImage6: String = "play6"

    
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
                VStack{
                                    
                    NavigationLink(destination: RealTimeClassifyView(), tag: 4, selection: $action) {}
                    
                    
                    ZstackThirdVoxView(subtitle: "", subtitleColor: .white, title: "", titleSize: 50, bodyIsOn: true, bodyText: "The figure below visualizes the analysis result of an infant's cry using the MFCC (Mel-Frequency Cepstral Coefficients) algorithm. It is observed that the shape of the infant's cry differs for each class. On the next page, we will analyze the infant's cry in real-time.", bodyTextColor: .white, bodyTextSize: 23, bodyPaddingTop: 30, bodyWidth: 800)
                    
                    HStack{
                        
                        ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 250, cardSymbolHeight: 40, cardImage: playImage1, className: "Tired",
                                             resultImage: analyzeResultImage1, resultImageWidth: 280, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
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
                        
                        ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 250, cardSymbolHeight: 40, cardImage: playImage2, className: "Discomfort",
                                             resultImage: analyzeResultImage2, resultImageWidth: 280, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
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
                        
                        
                        ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 250, cardSymbolHeight: 40, cardImage: playImage3, className: "Herger",
                                             resultImage: analyzeResultImage3, resultImageWidth: 280, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
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
                        
                        
                    }
                    
                    HStack{
                        
                        ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 230, cardSymbolHeight: 40, cardImage: playImage4, className: "Pain",
                                             resultImage: analyzeResultImage4, resultImageWidth: 280, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
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
                            }                        }
                        
                        ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 230, cardSymbolHeight: 40, cardImage: playImage5, className: "Burping",
                                             resultImage: analyzeResultImage5, resultImageWidth: 280, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
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
                        
                        
                        
                        ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 230, cardSymbolHeight: 40, cardImage: playImage6, className: "Laugh",
                                             resultImage: analyzeResultImage6, resultImageWidth: 280, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                        .onTapGesture {
                            playSound(sound: "laugh")
                            if Isplay == false {
                                player?.play()
                                self.playImage6 = "stop6"
                                Isplay.toggle()
                            } else {
                                // player.stop()
                                player?.stop()
                                self.playImage6 = "play6"
                                Isplay.toggle()
                            }
                        }
                        
                        
                        
                        
                        
                    }
                    VStack{
                
                           
                            Button(action: {
                                self.action = 4
                                nextPageButton = true
                            }, label: {
                                Text("Real-Time Analysis")
                                    .bold()
                                    .font(.title3)
                                    .frame(width: 280, height: 60)
                                    .foregroundColor(.white)
                                    .background(LinearGradient(colors: [.teal, .purple], startPoint: .leading, endPoint: .trailing))
                                    .clipShape(Capsule())
                                
                            })
                            
    
            
                
                    }.padding(.top, 20)
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .offset(y: -70)
                
               
            }
        
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
            .preferredColorScheme(.dark)
    }
}
