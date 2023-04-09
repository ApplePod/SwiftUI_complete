import SwiftUI
import AVKit
import SoundAnalysis

struct RealTimeClassifyView: View {

    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            
            
            Text(viewModel.placeholderText)
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
                .padding()
            
            Text(viewModel.transcribedText)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .padding()
        }
        .onAppear {
            viewModel.startAudioEngine()
        }
    }
}

struct RealTimeClassifyView_Previews: PreviewProvider {
    static var previews: some View {
        RealTimeClassifyView()
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

