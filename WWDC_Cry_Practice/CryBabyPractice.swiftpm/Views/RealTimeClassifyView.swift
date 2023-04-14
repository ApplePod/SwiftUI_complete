import SwiftUI
import AVKit
import SoundAnalysis

struct RealTimeClassifyView: View {

    @StateObject var viewModel = ContentViewModel()
    @StateObject var viewModel2 = ContentViewModel2()

    var body: some View {

            NavigationView {


                VStack(spacing: 50) {

                    HStack{
                        
                        CardView(cardSymbolIsOn: true, cardSymbolName: "", cardSymbolSize: 70, cardSymbolColor: .white, cardSymbolWidth: 10, cardSymbolHeight: 10, cardImage: "", cardSubtitleIsOn: true, cardSubtitle: "", cardSubtitleSize: 15, cardSubtitleColor: .white, cardTitle: "", cardTitleSize: 22, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.7, width: 10, height: 10, cornerRadius: 0, backgroundColor: .black)
                        
                        ListeningSiriAnimation(scaleSize: 0.7)
                        
                        
                        CardView(cardSymbolIsOn: true, cardSymbolName: "", cardSymbolSize: 70, cardSymbolColor: .white, cardSymbolWidth: 10, cardSymbolHeight: 10, cardImage: "", cardSubtitleIsOn: true, cardSubtitle: "", cardSubtitleSize: 15, cardSubtitleColor: .white, cardTitle: "", cardTitleSize: 22, cardTitleColor: .white, paddingTop: 0, animationDuration: 0.7, width: 10, height: 10, cornerRadius: 0, backgroundColor: .black)
                    }

                    Text(viewModel.placeholderText)
                        .font(.system(size: 25))
                        .multilineTextAlignment(.center)


                    Text(viewModel.transcribedText)
                        .font(.system(size: 25))
                        .multilineTextAlignment(.center)


                    if viewModel.transcribedText2 == "Cry" {
                        Text(viewModel2.transcribedText)
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)

                }
            }
            }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .onAppear {
            viewModel.startAudioEngine()
            viewModel2.startAudioEngine()
        }

    }
}

class ContentViewModel: NSObject, ObservableObject, GenderClassifierDelegate {

    private let audioEngine = AVAudioEngine()
    private var soundClassifier = try! FirstSoundClassification(configuration: .init())

    var inputFormat: AVAudioFormat!
    var analyzer: SNAudioStreamAnalyzer!
    var resultsObserver = ResultsObserver()
    let analysisQueue = DispatchQueue(label: "com.custom.AnalysisQueue")

    @Published var transcribedText: String = ""
    @Published var transcribedText2: String = ""
    let placeholderText: String = "Baby cry Classification by\nSound as you Speak..."

    override init() {
        super.init()
        resultsObserver.delegate = self
        inputFormat = audioEngine.inputNode.inputFormat(forBus: 0)
        analyzer = SNAudioStreamAnalyzer(format: inputFormat)
    }

    func startAudioEngine() {
        do {
            let request = try SNClassifySoundRequest(mlModel: soundClassifier.model)
            try analyzer.add(request, withObserver: resultsObserver)
        } catch {
            print("Unable to prepare request: \(error.localizedDescription)")
            return
        }

        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 8000, format: inputFormat) { buffer, time in
            self.analysisQueue.async {
                self.analyzer.analyze(buffer, atAudioFramePosition: time.sampleTime)
            }
        }

        do{
            try audioEngine.start()
        } catch {
            print("error in starting the Audio Engin")
        }
    }

    func displayPredictionResult(identifier: String, confidence: Double) {
        DispatchQueue.main.async {
            self.transcribedText = "Recognition: \(identifier)\nConfidence \(confidence)"
            self.transcribedText2 = identifier

        }
    }
}

class ResultsObserver: NSObject, SNResultsObserving {
    var delegate: GenderClassifierDelegate?
    func request(_ request: SNRequest, didProduce result: SNResult) {
        guard let result = result as? SNClassificationResult,
              let classification = result.classifications.first else { return }
        let confidence = classification.confidence * 100.0

        if confidence > 60 {
            delegate?.displayPredictionResult(identifier: confidence > 99.9 ? classification.identifier : "Noisy", confidence: confidence)
        }
    }
}


protocol GenderClassifierDelegate {
    func displayPredictionResult(identifier: String, confidence: Double)
}


class ContentViewModel2: NSObject, ObservableObject, GenderClassifierDelegate {

    private let audioEngine = AVAudioEngine()
    private var soundClassifier = try! MySoundClassifier(configuration: .init())

    var inputFormat: AVAudioFormat!
    var analyzer: SNAudioStreamAnalyzer!
    var resultsObserver = ResultsObserver2()
    let analysisQueue = DispatchQueue(label: "com.custom.AnalysisQueue")

    @Published var transcribedText: String = ""
    let placeholderText: String = ""

    override init() {
        super.init()
        resultsObserver.delegate = self
        inputFormat = audioEngine.inputNode.inputFormat(forBus: 0)
        analyzer = SNAudioStreamAnalyzer(format: inputFormat)
    }

    func startAudioEngine() {
        do {
            let request = try SNClassifySoundRequest(mlModel: soundClassifier.model)
            try analyzer.add(request, withObserver: resultsObserver)
        } catch {
            print("Unable to prepare request: \(error.localizedDescription)")
            return
        }

        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 8000, format: inputFormat) { buffer, time in
            self.analysisQueue.async {
                self.analyzer.analyze(buffer, atAudioFramePosition: time.sampleTime)
            }
        }

        do{
            try audioEngine.start()
        } catch {
            print("error in starting the Audio Engin")
        }
    }

    func displayPredictionResult(identifier: String, confidence: Double) {
        DispatchQueue.main.async {
            self.transcribedText = "Recognition: \(identifier)\nConfidence \(confidence)"
        }
    }
}

class ResultsObserver2: NSObject, SNResultsObserving {
    var delegate: GenderClassifierDelegate?
    func request(_ request: SNRequest, didProduce result: SNResult) {
        guard let result = result as? SNClassificationResult,
              let classification = result.classifications.first else { return }
        let confidence = classification.confidence * 100.0

        if confidence > 60 {
            delegate?.displayPredictionResult(identifier: confidence > 94.0 ? classification.identifier : "", confidence: confidence)
        }
    }
}
