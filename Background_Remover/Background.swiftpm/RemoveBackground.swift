//
//  RemoveBackground.swift
//  Background
//
//  Created by Herry on 2023/04/01.
//

import SwiftUI
import Vision
import CoreML

class RemoveBackground: ObservableObject {
    
    private let model = try! VNCoreMLModel(for: DeepLabV3(configuration: MLModelConfiguration()).model )
    
    var InputImage : UIImage = UIImage()
    var isOriginalImageUsed : Bool = false
    @Published var outputImage : UIImage?
    
    func segmentImage() {
        let ciImage = CIImage(image: InputImage)!
        
        var request: VNCoreMLRequest
        request = VNCoreMLRequest(model: model, completionHandler: visionRequestDidComplete)
        request.imageCropAndScaleOption = .scaleFill
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        DispatchQueue.global().async {
            do {
                try handler.perform([request])
            } catch {
                print("Failed to perform segementation: \(error.localizedDescription) " )
            }
        }
    }
    
    func visionRequestDidComplete(request: VNRequest, error: Error?)
    {
        DispatchQueue.main.async {
            if let observations = request.results as? [VNCoreMLFeatureValueObservation],
               let segmentationMap = observations.first?.featureValue.multiArrayValue {
                let segmenatiaionMask = segmentationMap.image(min: 0, max: 1)
                
                self.outputImage = segmenatiaionMask!.resized(to: self.InputImage.size)
                
                self.outputImage = self.maskInputImage()
            }
        }
    }
    
    func maskInputImage() -> UIImage {
        let bgImage = UIImage(named: "Scenery")!.resized(to: self.InputImage.size)

        let beginImage = CIImage(cgImage: InputImage.cgImage!)
        let background = CIImage(cgImage: bgImage.cgImage!)
        let mask = CIImage(cgImage: (self.outputImage?.cgImage!)!)
        
        if let compositeImage = CIFilter(name: "CIBlendWithMask", parameters: [
            kCIInputImageKey: beginImage,
            kCIInputBackgroundImageKey:background,
            kCIInputMaskImageKey:mask])?.outputImage {
            
            let ciContext = CIContext(options: nil)
            let filteredImageReference = ciContext.createCGImage(compositeImage, from: compositeImage.extent)
            
            return UIImage(cgImage: filteredImageReference!)
        }
        
        return UIImage()
    }
    
    func blueImage(image : UIImage, blurAmount: CGFloat) -> UIImage? {
        let context = CIContext(options: nil)
        guard let inputImage = CIImage(image: image) else {return nil}
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(blurAmount, forKey: kCIInputRadiusKey)
        
        guard let outputImage = filter?.outputImage,
              let cgImage = context.createCGImage(outputImage, from: inputImage.extent)
        else {return nil}
        
        return UIImage(cgImage: cgImage)
    }
}


extension UIImage {
    class func imageFromColor(color: UIColor, size: CGSize =  CGSize(width: 1, height: 1), scale: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
