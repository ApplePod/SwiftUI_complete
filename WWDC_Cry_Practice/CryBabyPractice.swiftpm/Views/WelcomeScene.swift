import SwiftUI
import AVKit

struct WelcomeScene: View {
    
    // MARK: Properties
    
    // Controlling the page navigation.
    @State var nextPage: Bool = false
    @State private var action: Int? = 0
    @State var audioPermissionAlert = true
    @State var videoPermissionAlert = true
    
    // MARK: Animation Properties
    @State var navigationButtonOpacity = 0.0
    
    // MARK: View
    
    var body: some View {
    
        NavigationView {
            VStack {
                
                NavigationLink(destination: SecondView(), tag: 1, selection: $action) {
                    
                }

                Spacer()
            
                VStack(alignment: .leading, spacing: 0) {
                    
                    // The informational text which is appears on the top of the screen.
                    IntroView(subtitle: "", subtitleColor: Color.white, title: "BabyCryNetAI", titleSize: 36, bodyIsOn: true, bodyText: "As we raise children, we reach the limits of our gaze and physical endurance. Technology exists to surpass these limitations and push beyond them.", bodyTextColor: Color.secondary, bodyTextSize: 23, bodyPaddingTop: 5, bodyWidth: 800)
                    
                    // Card View
                    HStack(spacing: 30) {
                        
                        // "What is Parkinson" Card
                        CardView(cardSymbolIsOn: true, cardSymbolName: "figure.2.and.child.holdinghands", cardSymbolSize: 70, cardSymbolColor: .white, cardSymbolWidth: 250, cardSymbolHeight: 166, cardImage: "", cardSubtitleIsOn: true, cardSubtitle: "What is", cardSubtitleSize: 15, cardSubtitleColor: .white, cardTitle: "We want to give our parents the gift of freedom.", cardTitleSize: 22, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.6, width: 250, height: 250, cornerRadius: 40, backgroundColor: .black)
                        
                        // "What is ParkinsonAI" Card
                        
                        ZStack{
                           
                         
                            
                            CardView(cardSymbolIsOn: true, cardSymbolName: "", cardSymbolSize: 70, cardSymbolColor: .white, cardSymbolWidth: 250, cardSymbolHeight: 166, cardImage: "", cardSubtitleIsOn: true, cardSubtitle: "What is", cardSubtitleSize: 15, cardSubtitleColor: .white, cardTitle: "Real-time analysis of an infant's crying sound.", cardTitleSize: 22, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.7, width: 250, height: 250, cornerRadius: 40, backgroundColor: .black)

                            ListeningSiriAnimation(scaleSize: 0.6)
                                .offset(x: 0, y: -30)

                        }
                        
                        //  "AI Diagnosis" Card
                        CardView(cardSymbolIsOn: false, cardSymbolName: "", cardSymbolSize: 70, cardSymbolColor: .white, cardSymbolWidth: 250, cardSymbolHeight: 166, cardImage: "tired", cardSubtitleIsOn: false, cardSubtitle: "", cardSubtitleSize: 0, cardSubtitleColor: .white, cardTitle: "AI diagnoses into six classes.", cardTitleSize: 22, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.8, width: 250, height: 250, cornerRadius: 40, backgroundColor: .black)
                    }
                    .background(Group {
                        EmptyView()
                    }, alignment: .center)
                    .padding(.top, 60)
                }
                
                Spacer()
                
                // Navigation Button
                HStack(alignment: .bottom, spacing: 0) {
                    Spacer()
                    Button("Get Started") {
                        
                        withAnimation {
                            nextPage = true
                            self.action = 1
                     
                        }
                    }
                    .buttonStyle(NavigationButtonStyle(color: .blue))
                    
                   
                }
                .padding(.leading, 20)
                .padding(.bottom, 20)
                .opacity(navigationButtonOpacity)
                .basicEaseIn(delayCount: 1, {
                    navigationButtonOpacity = 1.0
                })
                
            }
        }
        .navigationViewStyle(.stack)
        
    }
    
}
