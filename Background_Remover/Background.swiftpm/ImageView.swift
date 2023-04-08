//
//  ImageView.swift
//  Background
//
//  Created by Herry on 2023/04/02.
//

import SwiftUI

struct ImageView: View {
    
    var inputImage = UIImage(named: "Dog")
    @State var isOriginalImageUsed: Bool = true
    @ObservedObject var bgRemover = RemoveBackground( BackgroundName: "")
    @State var isImage: Bool = true
    
    var body: some View {
        VStack{
            
            if isImage == true {
                VStack{
                    Image(uiImage: inputImage!)
                        .resizable()
                        .scaledToFit()
                    
                    Button {
                        isImage.toggle()
                        bgRemover.InputImage = inputImage!
                        bgRemover.segmentImage()
                        
                    } label: {
                        Text("미국으로 가기")
                    }
                }
            } else {
                
                if bgRemover.outputImage != nil {
                    Image(uiImage: bgRemover.outputImage!)
                        .resizable()
                        .scaledToFit()
                    
                Button {
                    isImage.toggle()
                } label: {
                        Text("원본으로 가기")
                        }
                    }
                }
            }
        }
    }


