import SwiftUI
import AVKit
import SoundAnalysis


struct RealTimeClassifyView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var viewModel2 = ContentViewModel2()

    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                
                VStack {
                    
                    ZstackThirdVoxView(subtitle: "", subtitleColor: .white, title: "", titleSize: 50, bodyIsOn: true, bodyText: "Vox is analyzing the sound in the room in real time. If an infant's cry is heard, the analysis result is displayed in real time. If your infant is not currently crying or if you would like to test it, play the cries below.", bodyTextColor: .white, bodyTextSize: 23, bodyPaddingTop: 30, bodyWidth: 800)

                    Text(viewModel.transcribedText)
                        .font(.system(size: 25))
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    
                    Text(viewModel.transcribedText2 == "Cry" ? viewModel2.transcribedText : "Infant cries are not detected.")
                        .font(.system(size: 25))
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
    
                    
                }.frame(width: geo.size.width, height: geo.size.height)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(.stack)
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
            delegate?.displayPredictionResult(identifier: confidence > 99.0 ? classification.identifier : "", confidence: confidence)
        }
    }
}


struct RealTimeClassifyView_Previews: PreviewProvider {
    static var previews: some View {
        RealTimeClassifyView()
    }
}


