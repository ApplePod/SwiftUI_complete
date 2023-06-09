import CoreML


/// Model Prediction Input Type
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
class MySoundClassifierInput : MLFeatureProvider {

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
class MySoundClassifierOutput : MLFeatureProvider {

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
class MySoundClassifier {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "MySoundClassifier", withExtension:"mlmodelc")!
    }

    /**
        Construct MySoundClassifier instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of MySoundClassifier.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `MySoundClassifier.urlOfModelInThisBundle` to create a MLModel object to pass-in.

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
        Construct MySoundClassifier instance with explicit path to mlmodelc file
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
        Construct MySoundClassifier instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<MySoundClassifier, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct MySoundClassifier instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> MySoundClassifier {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct MySoundClassifier instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<MySoundClassifier, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(MySoundClassifier(model: model)))
            }
        }
    }

    /**
        Construct MySoundClassifier instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> MySoundClassifier {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return MySoundClassifier(model: model)
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as MySoundClassifierInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as MySoundClassifierOutput
    */
    func prediction(input: MySoundClassifierInput) throws -> MySoundClassifierOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as MySoundClassifierInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as MySoundClassifierOutput
    */
    func prediction(input: MySoundClassifierInput, options: MLPredictionOptions) throws -> MySoundClassifierOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return MySoundClassifierOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - audioSamples: Input audio samples to be classified as 15600 element vector of floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as MySoundClassifierOutput
    */
    func prediction(audioSamples: MLMultiArray) throws -> MySoundClassifierOutput {
        let input_ = MySoundClassifierInput(audioSamples: audioSamples)
        return try self.prediction(input: input_)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - audioSamples: Input audio samples to be classified as 15600 element vector of floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as MySoundClassifierOutput
    */

    func prediction(audioSamples: MLShapedArray<Float>) throws -> MySoundClassifierOutput {
        let input_ = MySoundClassifierInput(audioSamples: audioSamples)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [MySoundClassifierInput]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [MySoundClassifierOutput]
    */
    func predictions(inputs: [MySoundClassifierInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [MySoundClassifierOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [MySoundClassifierOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  MySoundClassifierOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
