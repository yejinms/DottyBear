//
//  TTSView.swift
//  DottyBear
//
//  Created by Niko Yejin Kim on 2023/04/20.
//

import Foundation
import AVFoundation

class TTSManager {
    
    static let shared = TTSManager()
    
    private let synthesizer = AVSpeechSynthesizer()
    
    internal func play(_ string: String) {
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en")
        utterance.rate = 0.3
        synthesizer.stopSpeaking(at: .immediate)
        synthesizer.speak(utterance)
    }
    
    internal func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

