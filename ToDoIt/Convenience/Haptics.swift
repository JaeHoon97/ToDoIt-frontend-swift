//
//  Haptics.swift
//  ToDoIt
//
//  Created by 재훈 on 5/29/24.
//

import UIKit

final class Haptics {
    static let Shared = Haptics()
    private init() { }
    
    let lightHapticStyle = UIImpactFeedbackGenerator.FeedbackStyle.light
    
    lazy var lightHapticGenerator = UIImpactFeedbackGenerator(style: lightHapticStyle)
    
    func generateLightHaptics() {
        lightHapticGenerator.prepare()
        lightHapticGenerator.impactOccurred()
    }

}
