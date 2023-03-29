//
//  SecondView.swift
//  TimerApp
//
//  Created by Herry on 2023/03/28.
//

import SwiftUI

struct SecondView: View {
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let date = Date()
    @Binding var hourSelection : Int
    @Binding var minuteSelection : Int
    @Binding var secondSelection : Int
    @Binding var resultSecond : Int
    
    @State var resultHour: Int
    @State var resultMin: Int
    @State var resultSec: Int
    
    
    var body: some View {
   
            GeometryReader { geometry in
                ZStack {
                Image("Count")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: geometry.size.height)

                
                    Text("\(resultHour, specifier: "%.02i"):\(resultMin, specifier: "%.02i"):\(resultSec, specifier: "%.02i")")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .padding(.bottom, 50)
                    .onReceive(timer) { _ in
                        if self.resultSecond > 0  {
                            self.resultSecond -= 1
                            
                            resultHour = resultSecond / 3600
                            resultMin = (resultSecond - (resultHour * 3600)) / 60
                            resultSec = resultSecond - (resultHour * 3600) - (resultMin * 60)
                            
                        }
                    }
                }
            
            }
    }
    
}
//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
