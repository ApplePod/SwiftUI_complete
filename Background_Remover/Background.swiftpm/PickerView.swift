//
//  PickerView.swift
//  Background
//
//  Created by Herry on 2023/04/02.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct PickerView: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        
        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
            Text("Select a photo")
        }.onChange(of: selectedItem) { newValue in
            Task {
                // Retrive selected asset in the form of Data
                if let data = try? await newValue?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                }
            }
        }
        
        if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
        }
        
    }
}
