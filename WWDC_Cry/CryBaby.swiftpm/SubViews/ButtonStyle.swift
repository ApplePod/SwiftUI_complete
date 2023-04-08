//
//  SwiftUIView.swift
//  
//
//  Created by Herry on 2023/04/07.
//

import SwiftUI

struct SwiftUIView: View {
    
    var buttonSymbolIsOn: Bool
    var CardSymbolName: String
    var cardSymbolSize: CGFloat
    var cardSymbolWidth: CGFloat
    var cardSymbolHeight: CGFloat
    var cardSymbolColor: Color
    
    
    var body: some View {
        HStack {
            if buttonSymbolIsOn {
                    
                Image(systemName: CardSymbolName)
                    .imageScale(.large)
                    .font(.system(size: cardSymbolSize, weight: .semibold, design: .default))
                    .frame(width: cardSymbolWidth, height: cardSymbolHeight)
                    .clipped()
                    .foregroundColor(cardSymbolColor)

            }
        }
    }
}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
////        SwiftUIView()
////    }
//}
