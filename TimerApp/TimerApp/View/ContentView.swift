//
//  ContentView.swift
//  TimerApp
//
//  Created by Herry on 2023/03/28.
//

import SwiftUI

struct ContentView: View {
    
   
    var body: some View {
        NavigationView {
            TabView {
                
                    PickerView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
            }
            .accentColor(.white)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PickerView: View {
    
    @State var selectTime = ""
    @State var hourSelection = 0
    @State var minuteSelection = 0
    @State var secondSelection = 0
    @State var resultSecond = 0
    
    @State var resultHour = 0
    @State var resultMin = 0
    @State var resultSec = 0
    
    var hours = [Int](0..<24)
    var minutes = [Int](0..<60)
    var second = [Int](0..<60)

    
    var body: some View {
        VStack(alignment: .leading){
            Text("Set time")
                .font(.system(size: 30))
                .padding([.leading, .top], 30)
                .bold()
                .foregroundColor(.white)
            
            GeometryReader { geometry in
                VStack {
                    HStack(spacing: -10) {
                        
                        
                        Picker(selection: self.$hourSelection) {
                            
                            ForEach(0 ..< self.hours.count) { index in
                                Text("\(self.hours[index])")
                                    .foregroundColor(.white)
                            }
                        } label: {
                            Text("")
                        }
                        .pickerStyle(.wheel)
                        
                        
                        Picker(selection: self.$minuteSelection) {
                            ForEach(0 ..< self.minutes.count) { index in
                                Text("\(self.minutes[index])")
                                    .foregroundColor(.white)
                            }
                        } label: {
                            Text("")
                        }.pickerStyle(.wheel)
                        
                        Picker(selection: self.$secondSelection) {
                            ForEach(0 ..< self.second.count) { index in
                                Text("\(self.second[index])")
                                    .foregroundColor(.white)
                            }
                        } label: {
                            Text("")
                        }.pickerStyle(.wheel)
                        
                    }
                    
                }
                
                HStack {
                    Button {
                        hourSelection = 0
                        minuteSelection = 0
                        secondSelection = 0

                    } label: {
                        ZStack{
                            Text("Reset")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                            
                            Rectangle()
                                .frame(width: 150, height: 80)
                                .foregroundColor(.clear)
                                .cornerRadius(20)
                        }
                    }
                    
                    NavigationLink {
                        SecondView(hourSelection: $hourSelection, minuteSelection: $minuteSelection, secondSelection: $secondSelection, resultSecond: $resultSecond, resultHour: resultHour, resultMin: resultMin, resultSec: resultSec)
                    } label: {
                        ZStack{
                        
                            Text("Start")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                            
                            Rectangle()
                                .frame(width: 150, height: 80)
                                .foregroundColor(.clear)
                                .cornerRadius(20)
                        }

                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        resultSecond = hourSelection * 3600 + minuteSelection * 60 + secondSelection
                        
                        resultHour = resultSecond / 3600
                        resultMin = (resultSecond - (resultHour * 3600)) / 60
                        resultSec = resultSecond - (resultHour * 3600) - (resultMin * 60)
                    })

                }.frame(width: geometry.size.width, height: geometry.size.height - 50)
                
            }
            
        }.background(.primary)
    }
}
