import SwiftUI
import AVFoundation
import CoreML

struct SecondView: View {
    
    // MARK: Properties
    
    // Controlling the page navigation.
    @State var nextPage: Bool = false
    @State private var action: Int? = 0
    @State var navigationButtonOpacity = 0.0
    @State var backgroundOpacity = 0.0
    // MARK: Animation Properties
    @State var playImage1: String = "play1"
    @State var playImage2: String = "play2"
    @State var playImage3: String = "play3"
    @State var playImage4: String = "play4"
    @State var playImage5: String = "play5"
    @State var Isplay: Bool = false
    @State var playToggle: Bool = true
    
    // AVAudioPlayer 인스턴스 생성
    @State var audio : AVAudioPlayer!
    
    // MARK: View
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                NavigationLink(destination: LoadingView(), tag: 1, selection: $action) {
                    
                }
                
                VStack {
                    Spacer()
                    HStack(spacing: 30) {
                        VStack{
                            
                            ZStack{
                                
                                
                                
                                // The informational text which is appears on the right side of the screen.
                                IntroView(subtitle: "Infant cry analysis AI.", subtitleColor: .white, title: "Hi, I am Sori", titleSize: 50, bodyIsOn: true, bodyText: "Hello, I am an AI sound analysis tool that specializes in analyzing the sounds of infants. I can distinguish infant cries into five categories: burping, discomfort, hunger, pain, and tiredness. Please feel free to listen to the sound on the right and try to distinguish which category it belongs to.", bodyTextColor: .white, bodyTextSize: 20, bodyPaddingTop: 30, bodyWidth: 500)
                                    .background(RoundedRectangle(cornerRadius: 47, style: .continuous)
                                        .fill(Color(.black))
                                        .frame(width: 585, height: 550)
                                        .clipped(), alignment: .center)
                                
                                ListeningSiriAnimation(scaleSize: 0.2)
                                    .offset(x: 120 ,y: -90)
                            }
                            
                        }
                        // Card View
                        
                        VStack(spacing: 20) {
                            
                            // Hand Termor Test Card
                            SecondViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 50, cardImage: playImage1, className: "Class 1", cardSubtitleIsOn: true, cardSubtitle: "Step 1", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
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
                            
                            
                            // Speaking Test Card
                            SecondViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 50, cardImage: playImage2, className: "Class 2", cardSubtitleIsOn: true, cardSubtitle: "Step 1", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
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
                            
                            // Handwriting Test Card
                            SecondViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 50, cardImage: playImage3, className: "Class 3", cardSubtitleIsOn: true, cardSubtitle: "Step 1", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
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
                            
                            SecondViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 50, cardImage: playImage4, className: "Class 4", cardSubtitleIsOn: true, cardSubtitle: "Step 1", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
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
                            
                            
                            SecondViewButtonStyle(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 20, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 50, cardImage: playImage5, className: "Class 5", cardSubtitleIsOn: true, cardSubtitle: "Step 1", cardSubtitleSize: 10, cardSubtitleColor: .orange, cardTitle: "", cardTitleSize: 13, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 173, height: 70, cornerRadius: 47, backgroundColor: Color(.black))
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
                            
                            
                            Text("Can you classify?")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 30))
                            
                        }
                        
                        
                        
                    }
                    .background(Group {
                        EmptyView()
                    }, alignment: .center)
                    .frame(width: 900, height: 700, alignment: .center)
                    .clipped()
                    .cornerRadius(47)
                    .opacity(backgroundOpacity)
                    .basicEaseIn(delayCount: 0) {
                        backgroundOpacity = 1.0
                    }
                    
                    Spacer()
                    
                    // Navigation button
                    HStack(alignment: .bottom, spacing: 0) {
                        Spacer()
                        
                        Button(action: {
                            self.action = 1
                        }, label: {
                            Text("Sori, can you help me?")
                                .font(.title)
                            
                        })
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                        
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                    .opacity(navigationButtonOpacity)
                    .basicEaseIn(delayCount: 1) {
                        navigationButtonOpacity = 1.0
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(.stack)
    }
}
    
    
    struct SecondView_Previews: PreviewProvider {
        static var previews: some View {
            SecondView()
        }
    }



