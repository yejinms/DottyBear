//
//  HapticView.swift
//  DottyBear
//
//  Created by Niko Yejin Kim on 2023/04/20.
//

import UIKit
import AVFoundation

enum Vibration: String, CaseIterable {
    
    static var allCases: [Vibration] {
        let defaultList = [
            error,
            success,
            warning,
            light,
            medium,
            heavy,
            selection,
            oldSchool,
        ]
        
        if #available(iOS 13.0, *) {
            return defaultList + [soft, rigid,]
        }
        
        return defaultList
    }
    
    case error
    case success
    case warning
    case light
    case medium
    case heavy
    case selection
    /// 옛 진동 방식
    case oldSchool
    case soft
    case rigid
    
    public func vibrate() {
        switch self {
        case .error:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        case .success:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case .warning:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        case .light:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .medium:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .heavy:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        case .soft:
                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        case .rigid:
                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()
        case .oldSchool:
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
}
