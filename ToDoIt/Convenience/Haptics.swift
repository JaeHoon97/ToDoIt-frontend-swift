//
//  Haptics.swift
//  ToDoIt
//
//  Created by 재훈 on 5/29/24.
//
// MARK: - 사용자의 화면 터치를 감지하고 진동을 발생
 
import UIKit

final class Haptics {
    
    static let Shared = Haptics()
    
    private init() { }
    
    let lightHapticStyle = UIImpactFeedbackGenerator.FeedbackStyle.light // 진동의 세기를 light로 설정
    
    lazy var lightHapticGenerator = UIImpactFeedbackGenerator(style: lightHapticStyle) // 진동을 발생시키는 Generator 생성
    
    func generateLightHaptics() {
        lightHapticGenerator.prepare() // 진동 준비
        lightHapticGenerator.impactOccurred() // 진동 발생
    }

}
