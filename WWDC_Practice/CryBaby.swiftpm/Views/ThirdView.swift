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
    
    @State var playImage1: String = "play1"
    @State var playImage2: String = "play2"
    @State var playImage3: String = "play3"
    @State var playImage4: String = "play4"
    @State var playImage5: String = "play5"

    
    @State var Isplay: Bool = false
    @State var playToggle: Bool = true
    
    @State var audio : AVAudioPlayer!
    
    // MARK: View
    
    var body: some View {
    
        NavigationView {
            VStack {
                
                NavigationLink(destination: RealTimeClassifyView(), tag: 1, selection: $action) {
                    
                }

                Spacer()
            
                VStack(alignment: .leading, spacing: 0) {
                    
                    // The informational text which is appears on the top of the screen.
                    IntroView(subtitle: "", subtitleColor: Color.white, title: "", titleSize: 50, bodyIsOn: true, bodyText: "", bodyTextColor: Color.secondary, bodyTextSize: 20, bodyPaddingTop: 5, bodyWidth: 1)
                    
                    
                    // Card View
                    HStack(spacing: 30) {

                        ZStack{
                           

                            CardView(cardSymbolIsOn: true, cardSymbolName: "", cardSymbolSize: 70, cardSymbolColor: .white, cardSymbolWidth: 250, cardSymbolHeight: 166, cardImage: "", cardSubtitleIsOn: true, cardSubtitle: "What is", cardSubtitleSize: 15, cardSubtitleColor: .white, cardTitle: "", cardTitleSize: 22, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.7, width: 600, height: 250, cornerRadius: 0, backgroundColor: .black)
                           

                            
                            VStack{
                                ListeningSiriAnimation(scaleSize: 0.2)
                                    .offset(x: 10, y: -30)
                                
                                Text("The infant's cry was analyzed through deep learning. MFCC (Mel-Frequency Cepstral Coefficients) algorithm was used. The figure below obtains the frequency component through Fast Fourier Transform and visualizes the result through Mel-Spectrogram.")
                                    .foregroundColor(.white)
                            }
                        }
                        
                    }
                    .background(Group {
                        EmptyView()
                    }, alignment: .center)

                    
                    
                    
                }
                
                Spacer()
                
                HStack{
                    
                    ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 50, cardImage: playImage1, className: "Tired",
                        resultImage: analyzeResultImage1, resultImageWidth: 250, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "Step 1", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                        .onTapGesture {
                            let song = NSDataAsset (name: "tired")
                            self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "acc")
                            if Isplay == false {
                                self.audio.play()
                                self.playImage1 = "stop1"
                                Isplay.toggle()
                            } else {
                                self.audio.stop()
                                self.playImage1 = "play1"
                                Isplay.toggle()
                            }
                        }
                    
                    ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 50, cardImage: playImage2, className: "Discomfort",
                        resultImage: analyzeResultImage2, resultImageWidth: 250, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "Step 1", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                        .onTapGesture {
                            let song = NSDataAsset (name: "discomfort")
                            self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "acc")
                            if Isplay == false {
                                self.audio.play()
                                self.playImage2 = "stop2"
                                Isplay.toggle()
                            } else {
                                self.audio.stop()
                                self.playImage2 = "play2"
                                Isplay.toggle()
                            }
                        }
                    
                    
                    ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 50, cardImage: playImage3, className: "Herger",
                        resultImage: analyzeResultImage3, resultImageWidth: 250, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "Step 1", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                        .onTapGesture {
                            let song = NSDataAsset (name: "hungry")
                            self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "acc")
                            if Isplay == false {
                                self.audio.play()
                                self.playImage3 = "stop3"
                                Isplay.toggle()
                            } else {
                                self.audio.stop()
                                self.playImage3 = "play3"
                                Isplay.toggle()
                            }
                        }
                    
 
                }
                Spacer()
                
                HStack{
                    
                    ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 50, cardImage: playImage4, className: "Pain",
                        resultImage: analyzeResultImage1, resultImageWidth: 250, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "Step 1", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                        .onTapGesture {
                            let song = NSDataAsset (name: "pain")
                            self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "acc")
                            if Isplay == false {
                                self.audio.play()
                                self.playImage4 = "stop4"
                                Isplay.toggle()
                            } else {
                                self.audio.stop()
                                self.playImage4 = "play4"
                                Isplay.toggle()
                            }
                        }
                    
                    ThirdViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 50, cardImage: playImage5, className: "Burping",
                        resultImage: analyzeResultImage2, resultImageWidth: 250, resultImageHeight: 160,cardSubtitleIsOn: true, cardSubtitle: "Step 1", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
                        .onTapGesture {
                            let song = NSDataAsset (name: "burping")
                            self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "acc")
                            if Isplay == false {
                                self.audio.play()
                                self.playImage5 = "stop5"
                                Isplay.toggle()
                            } else {
                                self.audio.stop()
                                self.playImage5 = "play5"
                                Isplay.toggle()
                            }
                        }

 
                }
                

                Spacer()
                // Navigation Button
                HStack(alignment: .bottom, spacing: 0) {
                    Spacer()
                    Button(action: {
                        self.action = 1
                    }, label: {
                        Text("Real-Time Analysis")
                            .font(.title)
                        
                    })
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .cornerRadius(40)
                   
                }
                .padding(.leading, 20)
                .padding(.bottom, 20)
                .opacity(navigationButtonOpacity)
                .basicEaseIn(delayCount: 1, {
                    navigationButtonOpacity = 1.0
                })
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(.stack)
        
    }
    
}


struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
