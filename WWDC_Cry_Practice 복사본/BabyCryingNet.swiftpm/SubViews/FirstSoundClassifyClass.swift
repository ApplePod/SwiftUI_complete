//
// FirstSoundClassification.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
class FirstSoundClassificationInput : MLFeatureProvider {

    /// Input audio samples to be classified as 15600 element vector of floats
    var audioSamples: MLMultiArray

    var featureNames: Set<String> {
        get {
            return ["audioSamples"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "audioSamples") {
            return MLFeatureValue(multiArray: audioSamples)
        }
        return nil
    }
    
    init(audioSamples: MLMultiArray) {
        self.audioSamples = audioSamples
    }

    convenience init(audioSamples: MLShapedArray<Float>) {
        self.init(audioSamples: MLMultiArray(audioSamples))
    }

}


/// Model Prediction Output Type
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
class FirstSoundClassificationOutput : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// Probability of each category as dictionary of strings to doubles
    var classLabelProbs: [String : Double] {
        return self.provider.featureValue(for: "classLabelProbs")!.dictionaryValue as! [String : Double]
    }

    /// Most likely sound category as string value
    var classLabel: String {
        return self.provider.featureValue(for: "classLabel")!.stringValue
    }

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(classLabelProbs: [String : Double], classLabel: String) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["classLabelProbs" : MLFeatureValue(dictionary: classLabelProbs as [AnyHashable : NSNumber]), "classLabel" : MLFeatureValue(string: classLabel)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
class FirstSoundClassification {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "FirstSoundClassification", withExtension:"mlmodelc")!
    }

    /**
        Construct FirstSoundClassification instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of FirstSoundClassification.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `FirstSoundClassification.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    convenience init(configuration: MLModelConfiguration = MLModelConfiguration()) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct FirstSoundClassification instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct FirstSoundClassification instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<FirstSoundClassification, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct FirstSoundClassification instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> FirstSoundClassification {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct FirstSoundClassification instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<FirstSoundClassification, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(FirstSoundClassification(model: model)))
            }
        }
    }

    /**
        Construct FirstSoundClassification instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> FirstSoundClassification {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return FirstSoundClassification(model: model)
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as FirstSoundClassificationInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as FirstSoundClassificationOutput
    */
    func prediction(input: FirstSoundClassificationInput) throws -> FirstSoundClassificationOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as FirstSoundClassificationInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as FirstSoundClassificationOutput
    */
    func prediction(input: FirstSoundClassificationInput, options: MLPredictionOptions) throws -> FirstSoundClassificationOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return FirstSoundClassificationOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - audioSamples: Input audio samples to be classified as 15600 element vector of floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as FirstSoundClassificationOutput
    */
    func prediction(audioSamples: MLMultiArray) throws -> FirstSoundClassificationOutput {
        let input_ = FirstSoundClassificationInput(audioSamples: audioSamples)
        return try self.prediction(input: input_)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - audioSamples: Input audio samples to be classified as 15600 element vector of floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as FirstSoundClassificationOutput
    */

    func prediction(audioSamples: MLShapedArray<Float>) throws -> FirstSoundClassificationOutput {
        let input_ = FirstSoundClassificationInput(audioSamples: audioSamples)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [FirstSoundClassificationInput]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [FirstSoundClassificationOutput]
    */
    func predictions(inputs: [FirstSoundClassificationInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [FirstSoundClassificationOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [FirstSoundClassificationOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  FirstSoundClassificationOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
