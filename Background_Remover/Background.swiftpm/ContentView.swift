import SwiftUI
import PhotosUI


@available(iOS 16.0, *)
struct ContentView: View {
    
    var inputImage = UIImage(named: "Dog")
    @State var isOriginalImageUsed: Bool = false
    @ObservedObject var bgRemover = RemoveBackground()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    
    var body: some View {
        
        VStack {
            
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

    
            Image(uiImage: inputImage!)
                .resizable()
                .scaledToFit()
            if bgRemover.outputImage != nil {
                Image(uiImage: bgRemover.outputImage!)
                    .resizable()
                    .scaledToFit()
                
            } else  {
                
                Button("Segment") {
                    bgRemover.InputImage = inputImage!
                    bgRemover.segmentImage()
                    
                    
                }
                
                
            }
            
        }.padding()
    }
}
